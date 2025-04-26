class_name Red_Fox
extends Enemy_Main_Class

@export var attack_range := 100.0
@export var attack_cooldown := 2.0

var can_attack := true

func _ready():
	super._ready()
	left_bounds = global_position + Vector2(-300, 0)
	right_bounds = global_position + Vector2(300, 0)
	timers.wait_time = attack_cooldown

func _physics_process(delta):
	handle_gravity(delta)
	
	if animate_state != state.HURT and animate_state != state.DIED:
		look_for_player()
		change_direction()
		handle_movement(delta)
	
	move_and_slide()
	update_state()

func change_direction():
	if not is_instance_valid(target_player) or not is_instance_valid(enemy_sprites):
		return
	
	# Jika dalam jarak serang
	if global_position.distance_to(target_player.global_position) < attack_range:
		if can_attack:
			animate_state = state.ATTACK
			attack()
		return
	
	# Patroli atau chase
	if animate_state == state.IDDLE:
		if enemy_sprites.flip_h:
			if global_position.x <= right_bounds.x:
				direction = Vector2.RIGHT
			else:
				direction = Vector2.LEFT
				enemy_sprites.flip_h = false
		else:
			if global_position.x >= left_bounds.x:
				direction = Vector2.LEFT
			else:
				direction = Vector2.RIGHT
				enemy_sprites.flip_h = true
	else:
		direction = (target_player.global_position - global_position).normalized()
		
	# Flip sprite berdasarkan arah
	if direction.x > 0:
		enemy_sprites.flip_h = true
	elif direction.x < 0:
		enemy_sprites.flip_h = false

func attack():
	if not can_attack or not is_instance_valid(target_player):
		return
	
	can_attack = false
	timers.start()
	
	# Trigger animasi serangan
	enemy_sprite_animation.play("Attack")
	await enemy_sprite_animation.animation_finished
	
	# Beri damage jika masih dalam jarak
	if global_position.distance_to(target_player.global_position) < attack_range * 1.2:
		target_player.take_damage(damage, AP, APdmg)
	
	animate_state = state.RUNNING

func _on_attack_cooldown_timeout():
	can_attack = true

func died():
	animate_state = state.DIED
	enemy_sprite_animation.play("Died")
	await enemy_sprite_animation.animation_finished
	queue_free()
	MissionStatData.update_enemy_kills()
