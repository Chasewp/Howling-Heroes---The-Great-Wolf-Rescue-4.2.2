class_name Brown_Bear
extends Enemy_Main_Class

@export var attack_range := 100.0
@export var attack_cooldown := 2.0
@export var patrol_speed := 50.0
@export var chase_speed := 150.0
@export var recovery_time := 0.5 # Time to recover after being hurt

var is_chasing := false
var patrol_direction := 1
var can_attack := true
var is_recovering := false

func _ready():
	super._ready()
	left_bounds = global_position + Vector2(-300, 0)
	right_bounds = global_position + Vector2(300, 0)
	patrol_direction = 1 if randf() > 0.5 else -1  
	enemy_raycast.target_position = Vector2(attack_range, 0)
	
func _physics_process(delta):
	if animate_state == state.DIED:
		return
		
	handle_gravity(delta)
	
	# Special handling for hurt state
	if animate_state == state.HURT:
		handle_hurt_state()
		return
		
	if animate_state != state.DIED:
		look_for_player()
		change_direction()
		handle_movement(delta)
		
	update_state()

func handle_hurt_state():
	# Only process hurt state logic once
	if is_recovering:
		return
		
	is_recovering = true
	velocity = Vector2.ZERO # Stop movement when hurt
	
	# Wait for hurt animation to finish
	await enemy_sprite_animation.animation_finished
	
	# Additional recovery time
	await get_tree().create_timer(recovery_time).timeout
	
	# Reset states
	is_recovering = false
	animate_state = state.RUNNING if is_chasing else state.IDDLE

func change_direction():
	if not is_instance_valid(target_player) or not is_instance_valid(enemy_sprites):
		return
	
	var distance_to_player = global_position.distance_to(target_player.global_position)
	var can_see_player = enemy_raycast.is_colliding() and enemy_raycast.get_collider() == target_player
	
	# Attack logic
	if distance_to_player < attack_range and can_see_player and can_attack:
		animate_state = state.ATTACK
		attack()
		is_chasing = true
		return
	
	# Chase logic
	elif distance_to_player < attack_range * 3:
		is_chasing = true
		direction = (target_player.global_position - global_position).normalized()
		animate_state = state.RUNNING
	
	# Patrol logic
	else:
		is_chasing = false
		patrol_behavior()

func attack():
	if not is_instance_valid(target_player) or not can_attack:
		return
		
	can_attack = false
	enemy_sprite_animation.play("Attack")
	
	# Wait for attack animation to complete
	await enemy_sprite_animation.animation_finished
	
	# Apply damage if still in range
	if (is_instance_valid(target_player) and 
		global_position.distance_to(target_player.global_position) < attack_range * 1.2):
		
		var overlapping_bodies = hit_box.get_overlapping_bodies()
		for body in overlapping_bodies:
			if body.is_in_group("player"):
				body.take_damage(damage, AP, APdmg)
	
	# Cooldown before next attack
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true
	
	animate_state = state.RUNNING

func take_damage(amount: float, _is_ap: bool, _ap_dmg: float):
	if is_invincible or animate_state == state.DIED:
		return
		
	super.take_damage(amount, _is_ap, _ap_dmg)
	
	# Immediately transition to hurt state
	if animate_state != state.DIED:
		animate_state = state.HURT
		is_chasing = true # Chase player after being hit

func patrol_behavior():
	if animate_state == state.DIED:
		return
	
	# Check bounds
	if global_position.x >= right_bounds.x:
		patrol_direction = -1
	elif global_position.x <= left_bounds.x:
		patrol_direction = 1
	
	direction = Vector2(patrol_direction, 0)
	
	if is_instance_valid(enemy_sprites):
		enemy_sprites.flip_h = patrol_direction == -1
	
	# Random idle pauses
	if (global_position.x >= right_bounds.x or global_position.x <= left_bounds.x) and randf() < 0.3:
		animate_state = state.IDDLE
		get_tree().create_timer(randf_range(0.5, 1.5)).timeout.connect(
			func(): 
				if is_instance_valid(self) and animate_state == state.IDDLE:
					animate_state = state.RUNNING
		)

func handle_movement(delta:float):
	var current_speed = chase_speed if is_chasing else patrol_speed
	
	if animate_state == state.RUNNING:
		velocity.x = move_toward(velocity.x, direction.x * current_speed, Acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, Acceleration * delta)
		
	move_and_slide()

func died():
	super.died()
	MissionStatData.update_enemy_kills()
