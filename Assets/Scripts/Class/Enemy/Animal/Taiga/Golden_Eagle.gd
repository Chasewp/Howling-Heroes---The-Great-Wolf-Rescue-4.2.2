class_name Golden_Eagle
extends Enemy_Main_Class

@export var attack_range := 100.0
@export var attack_cooldown := 2.0
@export var max_distance := 300.0  # Patrol area radius in pixels

@onready var start_position_marker = $StartPositionMarker
@onready var left_bound_marker = $LeftBoundMarker
@onready var right_bound_marker = $RightBoundMarker

var is_chasing := false
var patrol_direction := 1
var can_attack := true
var start_position := Vector2.ZERO

func _ready():
	is_flying = true
	start_position = global_position  # Store initial spawn position
	
	# Initialize markers if not placed in scene
	if not start_position_marker:
		start_position_marker = Marker2D.new()
		start_position_marker.position = Vector2.ZERO
		add_child(start_position_marker)
		start_position_marker.top_level = true
		start_position_marker.global_position = start_position
	
	if not left_bound_marker:
		left_bound_marker = Marker2D.new()
		left_bound_marker.position = Vector2(-max_distance, 0)
		add_child(left_bound_marker)
		left_bound_marker.top_level = true
		left_bound_marker.global_position = start_position + Vector2(-max_distance, 0)
	
	if not right_bound_marker:
		right_bound_marker = Marker2D.new()
		right_bound_marker.position = Vector2(max_distance, 0)
		add_child(right_bound_marker)
		right_bound_marker.top_level = true
		right_bound_marker.global_position = start_position + Vector2(max_distance, 0)
	
	super._ready()

func _physics_process(delta):
	if animate_state == state.DIED:
		return
		
	handle_gravity(delta)
	
	if animate_state != state.HURT and animate_state != state.DIED:
		look_for_player()
		change_direction()
		handle_flying_movement(delta)
	
	update_state()

func change_direction():
	if not is_instance_valid(target_player) or not is_instance_valid(enemy_sprites):
		return
	
	var distance_to_player = global_position.distance_to(target_player.global_position)
	
	# Attack logic
	if distance_to_player < attack_range and can_attack:
		animate_state = state.ATTACK
		attack()
		return
	
	# Patrol logic
	if distance_to_player > attack_range * 1.5:
		is_chasing = false
		
		# Check bounds relative to start position
		if global_position.x > start_position.x + max_distance:
			patrol_direction = -1
		elif global_position.x < start_position.x - max_distance:
			patrol_direction = 1
		
		direction = Vector2(patrol_direction, 0)
	else:
		# Chase player but stay within bounds
		is_chasing = true
		var to_player = (target_player.global_position - global_position).normalized()
		direction = to_player
		
		# Limit movement within patrol area
		var target_x = clamp(
			target_player.global_position.x,
			start_position.x - max_distance,
			start_position.x + max_distance
		)
		direction.x = sign(target_x - global_position.x)
	
	# Flip sprite based on direction
	if is_instance_valid(enemy_sprites):
		enemy_sprites.flip_h = direction.x > 0

func handle_flying_movement(delta):
	if not is_flying or animate_state == state.ATTACK:
		return
	
	# Smooth movement with bounds enforcement
	var target_velocity = direction * speed
	velocity = velocity.lerp(target_velocity, 0.1)
	
	# Limit movement to patrol area
	var new_x = clamp(
		global_position.x + velocity.x * delta,
		start_position.x - max_distance,
		start_position.x + max_distance
	)
	
	global_position.x = new_x
	move_and_slide()

func attack():
	if not is_instance_valid(target_player) or not can_attack:
		return
	
	can_attack = false
	velocity = Vector2.ZERO  # Stop during attack
	
	if is_instance_valid(enemy_sprite_animation):
		enemy_sprite_animation.play("Attack")
		await enemy_sprite_animation.animation_finished
	
	# Apply damage if still in range
	if (is_instance_valid(target_player) and 
	   global_position.distance_to(target_player.global_position) < attack_range * 1.2):
		
		var overlapping_bodies = hit_box.get_overlapping_bodies()
		for body in overlapping_bodies:
			if body.is_in_group("player"):
				body.take_damage(damage, AP, APdmg)
	
	# Attack cooldown
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true
	animate_state = state.RUNNING

func died():
	if not is_instance_valid(self):
		return
		
	super.died()
	MissionStatData.update_enemy_kills()
