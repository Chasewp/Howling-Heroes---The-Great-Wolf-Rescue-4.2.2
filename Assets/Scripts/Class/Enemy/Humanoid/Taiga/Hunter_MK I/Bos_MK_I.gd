class_name Hunter_MK_I
extends Enemy_Main_Class

@onready var fire_timer = $Fire_Timer
@onready var bullet_spawn_point = $Muzzle

@export var attack_range := 100.0
@export var attack_cooldown := 2.0
@export var bullet_spawn_offset := Vector2(20, -10) # Offset posisi tembak relatif terhadap sprite


# Variabel kontrol aktivasi
var is_activated := false
var is_attacking := false  # New flag to prevent overlapping attacks
var enemy_bullet = load("res://Assets/Scences/Items/Bullets/Riffle_Bullets/Enemy_Bullets-Pistol.tscn")

func _ready():
	super._ready()
	left_bounds = global_position + Vector2(-300, 0)
	right_bounds = global_position + Vector2(300, 0)
	#timers.wait_time = attack_cooldown
	fire_timer.stop()
	
	# Atur posisi spawn point bullet berdasarkan flip sprite
	update_bullet_spawn_position()
	
# Fungsi untuk dijalankan saat pemain masuk area trigger
func activate_boss():
	is_activated = true
	fire_timer.start()
	 
func update_bullet_spawn_position():
	# Pastikan flip state konsisten
	if enemy_sprites.flip_h:
		bullet_spawn_point.position.x = abs(bullet_spawn_offset.x)
		bullet_spawn_point.scale.x = 1
	else:
		bullet_spawn_point.position.x = -abs(bullet_spawn_offset.x)
		bullet_spawn_point.scale.x = -1
		
	# Posisi Y tetap sama
	bullet_spawn_point.position.y = bullet_spawn_offset.y

func _physics_process(delta):
	if not is_activated or animate_state == state.DIED:
		return
	
	handle_gravity(delta)
	
	# Prioritaskan state HURT
	if animate_state == state.HURT:
		move_and_slide()
		return
	
	# Proses AI hanya jika tidak sedang attack
	if not is_attacking:
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
		if not is_attacking:
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
	
	update_bullet_spawn_position() # Update posisi tembak setelah flip

func attack():
	if not is_instance_valid(target_player) or is_attacking or animate_state == state.HURT:
		return
	
	is_attacking = true
	velocity = Vector2.ZERO # Hentikan gerakan saat attack
	
	# Pastikan player masih dalam jarak dan terlihat
	if global_position.distance_to(target_player.global_position) < attack_range * 1.2:
		enemy_sprite_animation.play("Attack")
		await enemy_sprite_animation.animation_finished
		
		# Beri damage jika masih dalam jangkauan
		if (global_position.distance_to(target_player.global_position) < attack_range * 1.2):
			target_player.take_damage(damage, AP, APdmg)
	
	animate_state = state.RUNNING
	is_attacking = false

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
	chest.position = global_position + Vector2(0,0)
	get_parent().add_child(chest)
	
	# 5. Panggil fungsi munculkan chest
	chest.boss_defeated()
	
	#6 Update Boss Killed
	MissionStatData.update_boss_kills()
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
	
	# Tampilkan muzzle flash
	#muzzle_flash.emitting = true
	await get_tree().create_timer(0.05).timeout
	#muzzle_flash.emitting = false
	
	# Gunakan bullet_spawn_point sebagai posisi awal
	var bullet = enemy_bullet.instantiate()
	
	# Hitung arah dengan mempertimbangkan flip sprite
	var target_pos = target_player.global_position
	var spawn_pos = bullet_spawn_point.global_position
	
	# Hitung arah yang benar
	var fire_direction
	if enemy_sprites.flip_h:
		fire_direction = Vector2.RIGHT
	else:
		fire_direction = Vector2.LEFT
		
	# Jika player di belakang, sesuaikan arah
	if sign(target_pos.x - global_position.x) != sign(fire_direction.x):
		fire_direction.x *= -1
	
	bullet.rotation = fire_direction.angle()
	bullet.position = spawn_pos
	bullet.direction = fire_direction # Pastikan bullet punya properti direction
	bullet.speed = 400
	
	get_parent().call_deferred("add_child", bullet)
	
func _on_activation_area_body_entered(body):
	if body.is_in_group("player"):
		activate_boss() 
