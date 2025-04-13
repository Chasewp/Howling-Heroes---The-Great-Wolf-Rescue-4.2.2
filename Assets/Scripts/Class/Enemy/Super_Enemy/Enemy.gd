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
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_health : float
var current_armor : float

func _ready():
	# Initialize hurtbox values
	hurt_box.Healths = hlt
	hurt_box.Armors = arm
	hurt_box.Eficient_Armors = eficient_Armor
	
	#target player
	target_player = get_tree().root.get_node("World_Stages/Player")
	# Set current values
	current_armor = arm
	current_health = hlt
	
	# Setup UI bars
	health_bar.max_value = hlt
	health_bar.value = current_health
	armor_bar.max_value = arm
	armor_bar.value = current_armor
	
	# Connect damage signals
	hurt_box.received_damage.connect(_on_received_damage)
	hurt_box.executed.connect(_on_enemy_died)
	
	# Find player if not assigned
	if not target_player:
		return

func _on_received_damage(_damage: float, _is_ap: bool, _ap_dmg: float):
	# Update current values from hurtbox
	current_health = hurt_box.Healths
	current_armor = hurt_box.Armors
	
	# Update health and armor bars
	health_bar.value = current_health
	armor_bar.value = current_armor
	
	# Play hurt animation if not dead
	if current_health > 0:
		animate_state = state.HURT
		enemy_sprite_animation.play()
		update_animation(direction.x)
		
	# Debug print
	print("Damage Received - Health: ", current_health, " Armor: ", current_armor)

func _on_enemy_died():
	animate_state = state.DIED
	update_animation(direction.x)
	# Add any death handling logic here
	set_physics_process(false) # Disable physics processing
	
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
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement(delta):
	if animate_state == state.RUNNING:
		velocity = velocity.move_toward(direction * speed, Acceleration * delta)
	move_and_slide()

func update_state():
		if animate_state == state.IDDLE: 
			return
		if is_on_floor():
			if velocity == Vector2.ZERO:
				animate_state = state.IDDLE
			elif  velocity.x != 0:
				animate_state = state.RUNNING
		else: 
			if velocity.y <0 :
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
