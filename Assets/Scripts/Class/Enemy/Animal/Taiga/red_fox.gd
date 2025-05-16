class_name Red_Fox
extends Enemy_Main_Class

@export var attack_range := 100.0
@export var attack_cooldown := 2.0
@export var patrol_speed := 50.0  # Slower speed when patrolling
@export var chase_speed := 150.0  # Faster speed when chasing

var is_chasing := false
var patrol_direction := 1  # 1 for right, -1 for left

func _ready():
	super._ready()
	# Set patrol bounds relative to spawn position
	left_bounds = global_position + Vector2(-125, 0)
	right_bounds = global_position + Vector2(125, 0)
	# Start with random initial direction
	patrol_direction = 1 if randf() > 0.5 else -1  
	enemy_raycast.target_position = Vector2(attack_range, 0)
	
func _physics_process(delta):
	# Hentikan proses jika enemy sudah mati
	if animate_state == state.DIED:
		return
		
	handle_gravity(delta)
	if animate_state != state.HURT and animate_state != state.DIED:
		look_for_player()
		change_direction()
		handle_movement(delta)
	## Update raycast direction
	#enemy_raycast.target_position = Vector2(-attack_range if enemy_sprites.flip_h else attack_range, 0)
	## Update raycast direction berdasarkan arah hadap
	#if is_instance_valid(enemy_sprites):
		#if enemy_sprites.flip_h:
			#enemy_raycast.target_position = Vector2(-attack_range, 0)
		#else:
			#enemy_raycast.target_position = Vector2(attack_range, 0)
	#
	## Pastikan enemy_sprites masih valid sebelum diakses
	#if is_instance_valid(enemy_sprites):
		#if enemy_sprites.flip_h:
			#enemy_raycast.target_position = Vector2(-attack_range, 0)
		#else:
			#enemy_raycast.target_position = Vector2(attack_range, 0)

	update_state()

func change_direction():
	if not is_instance_valid(target_player) or not is_instance_valid(enemy_sprites):
		return
	
	var distance_to_player = global_position.distance_to(target_player.global_position)
	var can_see_player = enemy_raycast.is_colliding() and enemy_raycast.get_collider() == target_player
	
	# 1. LOGICA SERANG
	if distance_to_player < attack_range and can_see_player:
		animate_state = state.ATTACK
		attack()
		is_chasing = true
		return
	
	# 2. LOGICA CHASE (30% lebih besar dari attack range)
	elif distance_to_player < attack_range * 3:
		is_chasing = true
		direction = (target_player.global_position - global_position).normalized()
		animate_state = state.RUNNING
	
	# 3. LOGICA PATROL
	else:
		is_chasing = false
		patrol_behavior()

func patrol_behavior():
	# Hentikan jika sudah mati
	if animate_state == state.DIED:
		return
	
	# Check bounds
	if global_position.x >= right_bounds.x:
		patrol_direction = -1
	elif global_position.x <= left_bounds.x:
		patrol_direction = 1
	
	direction = Vector2(patrol_direction, 0)
	
	# Update flip sprite hanya jika node masih valid
	if is_instance_valid(enemy_sprites):
		enemy_sprites.flip_h = patrol_direction == -1
	
	# Pause logic dengan pengecekan validitas
	if (global_position.x >= right_bounds.x or global_position.x <= left_bounds.x) and randf() < 0.3:
		animate_state = state.IDDLE
		get_tree().create_timer(randf_range(0.5, 1.5)).timeout.connect(
			func(): 
				# Tambahkan pengecekan triple
				if is_instance_valid(self) and is_instance_valid(enemy_sprites) and animate_state == state.IDDLE:
					animate_state = state.RUNNING
		)

		
func handle_movement(delta:float):
	# Use appropriate speed based on state
	var current_speed = chase_speed if is_chasing else patrol_speed
	
	if animate_state == state.RUNNING:
		velocity.x = move_toward(velocity.x, direction.x * current_speed, Acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, Acceleration * delta)
	
	move_and_slide()

func died():
	super.died()
	MissionStatData.update_enemy_kills()
