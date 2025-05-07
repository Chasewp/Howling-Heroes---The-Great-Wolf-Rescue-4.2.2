class_name Hunter_MK_I
extends Enemy_Main_Class


@onready var fire_timer = $Fire_Timer

@export var attack_range := 100.0
@export var attack_cooldown := 2.0

# Variabel kontrol aktivasi
var is_activated := false
	
var is_attacking := false  # New flag to prevent overlapping attacks
var enemy_bullet = load("res://Assets/Scences/Items/Bullets/Riffle_Bullets/Enemy_Bullets-Pistol.tscn")
func _ready():
	super._ready()
	left_bounds = global_position + Vector2(-300, 0)
	right_bounds = global_position + Vector2(300, 0)
	timers.wait_time = attack_cooldown
	fire_timer.stop()

# Fungsi untuk dijalankan saat pemain masuk area trigger
func activate_boss():
	is_activated = true
	fire_timer.start()
	
func _physics_process(delta):
	if not is_activated:
		return  # Jangan jalankan AI jika belum diaktifkan
	handle_gravity(delta)
	
	# Only process movement if not in hurt/died state
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
		if can_attack and not is_attacking:  # Prevent overlapping attacks
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
	if not can_attack or not is_instance_valid(target_player) or is_attacking:
		return
	
	is_attacking = true  # Set attacking flag
	can_attack = false
	timers.start()
	
	# Trigger animasi serangan
	enemy_sprite_animation.play("Attack")
	await enemy_sprite_animation.animation_finished
	
	# Beri damage jika masih dalam jarak
	if (is_instance_valid(target_player) and 
		global_position.distance_to(target_player.global_position) < attack_range * 1.2):
		target_player.take_damage(damage, AP, APdmg)
	
	animate_state = state.RUNNING
	is_attacking = false  # Reset attacking flag

func _on_attack_cooldown_timeout():
	can_attack = true


func died():
	super.died()
	
	# 1. Load scene chest dan key
	var chest_scene = load("res://Assets/Scences/Items/Chest/chest.tscn")
	var pine_key_scene = load("res://Assets/Scences/Items/Keys/Taiga/pine_key.tscn")
	
	# 2. Instantiate chest
	var chest = chest_scene.instantiate()
	
	# 3. Set key_scene dari code
	chest.key_scene = pine_key_scene
	
	# 4. Posisikan chest dan tambahkan ke scene
	chest.position = global_position + Vector2(0, -50)
	get_parent().add_child(chest)
	
	# 5. Panggil fungsi munculkan chest
	chest.boss_defeated()
	queue_free()
	

func _on_FireTimer_timeout():
	if not is_activated or animate_state == state.DIED: # Don't shoot if dead
		return 
	if is_instance_valid(target_player) and global_position.distance_to(target_player.global_position) < 500:	
		for i in range(3):
			fire_bullet_towards_player(i*0.1)

func fire_bullet_towards_player(delay = 0.0):
	await get_tree().create_timer(delay).timeout
	if not is_instance_valid(target_player) or animate_state == state.DIED:
		return
		
	var bullet = enemy_bullet.instantiate()
	var direction = (target_player.global_position - global_position).normalized()
	bullet.rotation = direction.angle()
	bullet.position = global_position
	bullet.speed = 400
	get_parent().add_child(bullet)
	
func _on_activation_area_body_entered(body):
	if body.is_in_group("player"):
		activate_boss() 
