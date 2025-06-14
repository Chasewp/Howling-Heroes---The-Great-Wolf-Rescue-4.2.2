class_name Pharaoh_Eagle_Owl
extends Enemy_Main_Class

@export var attack_range := 100.0
@export var attack_cooldown := 2.0
@export var patrol_radius := 300.0  # Patrol area radius in pixels

var patrol_center: Vector2  # Center point for patrol area
var is_chasing := false
#var selesih_x = target_player.global_position.x - self.global_position.x

func _ready():
	is_flying = true
	patrol_center = global_position  # Set initial patrol center
	super._ready()
	#target_player = Player_controlled.new()
	
func _physics_process(delta):
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
	
	# Jika dalam jarak serang
	if distance_to_player < attack_range:
		animate_state = state.ATTACK
		attack()
		return
	
	# Patroli area terbatas (125 pixel dari posisi awal)
	if distance_to_player > attack_range * 1.5:  # Jika player cukup jauh
		is_chasing = false
		var distance_to_center = global_position.distance_to(patrol_center)
		
		if distance_to_center > patrol_radius:
			# Kembali ke area patroli
			direction = (patrol_center - global_position).normalized()
		else:
			# Patroli acak dalam area
			if animate_state == state.IDDLE or randf() < 0.01:
				direction = Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()
	else:
		# Chase player tapi tetap dalam radius patroli + buffer
		is_chasing = true
		
		var to_player = (target_player.global_position - global_position).normalized()
		var target_pos = patrol_center + (to_player * min(patrol_radius * 0.8, distance_to_player))
		direction = (target_pos - global_position).normalized()
	
	# Flip sprite berdasarkan arah
	if direction.x > 0:
		enemy_sprites.flip_h = true
	elif direction.x < 0:
		enemy_sprites.flip_h = false

func handle_flying_movement(delta):
	if not is_flying:
		return
	
	# Gerakan lebih halus untuk burung
	var target_velocity = direction * speed
	velocity = velocity.lerp(target_velocity, 0.1)
	
	# Batasi gerakan vertikal saat tidak chase
	if not is_chasing:
		velocity.y *= 0.8
	
	move_and_slide()

func attack():
	if  not is_instance_valid(target_player):
		return
	
	enemy_sprite_animation.play("Attack")
	await enemy_sprite_animation.animation_finished
	
	if (is_instance_valid(target_player) and 
		global_position.distance_to(target_player.global_position) < attack_range * 1.2):
		target_player.take_damage(damage, AP, APdmg)
	
	animate_state = state.RUNNING

func died():
	super.died()
	MissionStatData.update_enemy_kills()
