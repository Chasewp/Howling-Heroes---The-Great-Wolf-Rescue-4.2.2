class_name Enemy_Main_Class
extends CharacterBody2D

enum state{
	IDDLE,
	RUNNING,
	JUMPUP,
	JUMPDOWN,
	HURT,
	DIED,
	ATTACK
}
var animate_state  = state.IDDLE

@export_category("Enemy Nodes")
@export var health_bar :ProgressBar
@export var armor_bar :ProgressBar
@export var hit_box :Hitboxes
@export var hurt_box :Hurtboxes
@export var target_player:CharacterBody2D
@export var enemy_sprites : AnimatedSprite2D
@export var enemy_sprite_animation : AnimationPlayer
@export var enemy_raycast : RayCast2D

@export_category("Enemy Class Variable")
@export var hlt : float
@export var arm : float
@export var jump : int
@export var speed : float
@export var damage : float
@export var Acceleration :float
@export var Jump_velocity : float
@export var AP : bool
@export var APdmg : float
@export var eficient_Armor:float
@export var direction:Vector2
@export var dis_min : int
@export var dis_max : int
@export var left_bounds : Vector2
@export var right_bounds : Vector2
@export var is_flying: bool = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_health : float
var current_armor : float

var is_invincible := false
var invincibility_duration := 1.2  # 0.5 detik
var has_been_counted := false 
var recently_hit := false 
var is_already_dead := false

func _ready():
	target_player = get_tree().root.get_node("World_Stages/Player")
	
	print(get_tree().root.get_node("World_Stages/Player"))  # Harus return valid node
	 # Initialize hurtbox values only if valid
	
	if is_instance_valid(hurt_box):
		hurt_box.Healths = hlt
		hurt_box.Armors = arm
		hurt_box.Eficient_Armors = eficient_Armor
		hurt_box.received_damage.connect(take_damage)

	
	#target player
	if not target_player:
		target_player = get_tree().root.get_node("World_Stages/Player")
		push_warning("Player node not found! Enemies will not function.")
	# Set current values
	current_armor = arm
	current_health = hlt
	
	# Setup UI bars
	health_bar.max_value = hlt
	health_bar.value = current_health
	armor_bar.max_value = arm
	armor_bar.value = current_armor
	
	## Connect damage signals
	hurt_box.received_damage.connect(take_damage)
	if target_player:
		target_player.tree_exiting.connect(_on_player_freed)

func _on_player_freed():
	target_player = null
	animate_state = state.IDDLE

func take_damage(_damage: float, _is_ap: bool, _ap_dmg: float):
	if is_invincible or is_already_dead:
		return
		
	# Early return if hurtbox is invalid
	if not is_instance_valid(hurt_box):
		return
	
	if recently_hit:
		return
	
	recently_hit = true
	await get_tree().create_timer(0.1).timeout
	recently_hit = false
	
	# Activate invincibility
	is_invincible = true
	await get_tree().create_timer(invincibility_duration).timeout
	is_invincible = false
	
	# Safely update values from hurtbox
	if is_instance_valid(hurt_box):
		current_health = hurt_box.Healths
		current_armor = hurt_box.Armors
		
		# Update UI bars
		health_bar.value = current_health
		armor_bar.value = current_armor
		
		if current_health <= 0:
			# Disable collisions safely
			if is_instance_valid(hit_box):
				hit_box.set_deferred("monitoring", false)
				hit_box.set_deferred("monitorable", false)
			if is_instance_valid(hurt_box):
				hurt_box.set_deferred("monitoring", false)
				hurt_box.set_deferred("monitorable", false)
			died()
		elif current_health > 0:
			animate_state = state.HURT
			enemy_sprite_animation.play("Hurt")
			await enemy_sprite_animation.animation_finished
			animate_state = state.RUNNING if velocity.length_squared() > 1 else state.IDDLE
			update_animation(direction.x)
	
	print("Damage Received ", _damage, " Health: ", current_health, " Armor: ", current_armor)

func died():
	if has_been_counted or is_already_dead:
		return
	
	is_already_dead = true
	has_been_counted = true
	animate_state = state.DIED
	
	# Stop processing physics
	set_physics_process(false)
	
	# Play death animation if components are valid
	if is_instance_valid(enemy_sprite_animation):
		enemy_sprite_animation.play("Died")
		await enemy_sprite_animation.animation_finished
	
	# Queue free after animation completes
	queue_free()
	
func is_dead() -> bool:
	return animate_state == state.DIED

func get_persistent_id() -> String:
	# Create a unique identifier for this enemy based on its position and type
	return "%s_%d_%d" % [name, global_position.x, global_position.y]
		
func move(dir,spd):
	spd = speed
	if is_on_wall() and  is_on_floor():
		velocity.y = Jump_velocity
	else:
		velocity.y += gravity	
		
	if animate_state == state.RUNNING:
		velocity.x = dir * spd
	
func screen_enter():
	health_bar.visible = true
	armor_bar.visible = true

func screen_exited():
	health_bar.visible = false
	armor_bar.visible = false
	
func update_health_bar():
	health_bar.value = current_health
	
func update_armor_bar():
	armor_bar.value = current_armor
	
func handle_gravity(delta):
	if is_flying:
		return # Burung gak perlu gravity
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement(delta:float):
	if animate_state == state.RUNNING:
		velocity = velocity.move_toward(direction * speed, Acceleration * delta)
	else :
		velocity = velocity.move_toward(direction*speed, Acceleration*delta)
	move_and_slide()

func update_state():
	if animate_state == state.DIED:
		return

	if is_flying:
		# Burung cukup antara IDDLE dan RUNNING (mungkin tambah ATTACK)
		if velocity.length() < 5:
			animate_state = state.IDDLE
		else:
			animate_state = state.RUNNING
	else:
		# Ground enemy logic
		if is_on_floor():
			if velocity == Vector2.ZERO:
				animate_state = state.IDDLE
			elif  velocity.x != 0:
				animate_state = state.RUNNING
		else: 
			if velocity.y < 0:
				animate_state = state.JUMPUP
			else:
				animate_state = state.JUMPDOWN
				
func update_animation(dir):
	if not is_instance_valid(enemy_sprites):
		return
	# Turn Right
	if dir > 0 :
		enemy_sprites.flip_h = false
	# turn Left
	elif dir <0:
		enemy_sprites.flip_h = true
		
	match  animate_state:	
		#Iddle Normal
		state.IDDLE:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Iddle_Flip")
			else:	
				enemy_sprite_animation.play("Iddle")
		#Normal Running
		state.RUNNING:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Run_Flip")
			else:	
				enemy_sprite_animation.play("Run")
			
		#Normal Jump	
		state.JUMPUP:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Jump_Flip")
			else:
				enemy_sprite_animation.play("Jump")
			
		#Normal Fall
		state.JUMPDOWN:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Fall_Flip")
			else:
				enemy_sprite_animation.play("Fall")
		
		#Hurt	
		state.HURT:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Hurt_Flip")
			else:
				enemy_sprite_animation.play("Hurt")
		
		#Died
		state.DIED:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Died_Flip")
			else:
				enemy_sprite_animation.play("Died")
			
		#Attack
		state.ATTACK:
			if enemy_sprites.flip_h:
				enemy_sprite_animation.play("Attack_Flip")
			else:
				enemy_sprite_animation.play("Attack")

func _on_enemy_health_changed(percentage:float):
	health_bar.value = hlt
	health_bar.set_value_no_signal(percentage)
	animate_state= state.HURT
	
func _on_enemy_armor_changed(percentage:float):
	armor_bar.value = arm
	armor_bar.set_value_no_signal(percentage)
	animate_state= state.HURT
	
func handle_flying_movement(delta):
	if not is_flying:
		return

	# Contoh: gerak ke player
	var dir = (target_player.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()

func look_for_player():
	if not is_instance_valid(enemy_raycast) or not is_instance_valid(target_player):
		return
	
	# Update raycast direction
	var player_dir = (target_player.global_position - global_position).normalized()
	enemy_raycast.target_position = player_dir * 300
	
	if enemy_raycast.is_colliding():
		var collider = enemy_raycast.get_collider()
		if collider == target_player:
			chase_player()
		else:
			stop_chase()
	else:
		stop_chase()
		
func chase_player():
	animate_state = state.RUNNING
	
func stop_chase():
	pass
	#if not is_chasing:
		#animate_state = state.IDDLE

func on_hurt_area_enemy(area):
	if not is_instance_valid(target_player):  # Pastikan player masih ada
		return
		
	if area.is_in_group("enemy_hitbox"):
		var enemy = area.get_parent()
		if is_instance_valid(enemy) and is_instance_valid(target_player):
			target_player.take_damage(enemy.damage, enemy.AP, enemy.APdmg)
func _safe_set_flip_h(value: bool):
	if is_instance_valid(enemy_sprites):
		enemy_sprites.call_deferred("set_flip_h", value)
		

		
func _physics_process(delta):
	if is_flying:
		handle_flying_movement(delta)
	else:
		handle_movement(delta)

func attack():
	#if not can_attack or not is_instance_valid(target_player):
		#return
	#
	#can_attack = false
	#timers.start()
	
	enemy_sprite_animation.play("Attack")
	await enemy_sprite_animation.animation_finished
	
	## Beri damage jika kondisi masih terpenuhi
	#if (is_instance_valid(target_player) and 
		#global_position.distance_to(target_player.global_position) < attack_range * 1.2 and
		#enemy_raycast.is_colliding() and 
		#enemy_raycast.get_collider() == target_player):
		#
		#target_player.take_damage(damage, AP, APdmg)
	var overlapping_body = hit_box.get_overlapping_bodies()
	for body in overlapping_body:
		if body.is_in_group("player"):
			body.take_damage(damage, AP, APdmg)
			
	animate_state = state.RUNNING
