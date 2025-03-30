class_name Player_controlled
extends CharacterBody2D

const  SAVE_DATA = "user://Save/Progress/Save_Progress.tres"
signal update_coordinate
signal update_ammo
signal executed
signal take_item(item :Node2D)

@export_category("Node Variables")
@onready var animation_player = $Sprites/Sprite_Animation
@onready var hurt_area_chest = %Hurt_Area_foot
@onready var hurt_area_foot = %Hurt_Area_foot
@onready var player_Sprites = $Sprites/Total_Sprites
@onready var player_collading = $coliding

#Brust Garou
@onready var SFX_Reloading_Weapon = $SFX/SFXReloading_rifle
@onready var SFX_Shoot = $SFX/SFXShoot
@onready var SFX_Ammo_Empty = $SFX/SFX_Ammo_Empty
@onready var brust_garou_sprite = $Sprites/BrustGarou
@onready var projectile = $Sprites/BrustGarou/Projectile
@export var bullets_caps_lbl : Label
@export var maganize_lbl : Label
@onready var reloading_riffle_sfx = $SFX/SFXReloading_rifle
@onready var reloading_voice_sfx = $SFX/SFXReloading_voice
@onready var ammo_empty_sfx = $SFX/SFX_Ammo_Empty
@onready var shooting_timer = $Timer/shoot_timer
@onready var reloading_timer =$Timer/reloading_timer
@onready var reloading_progress_bar = %Reload_ProgressBar
@onready var reloading_progress_display =  %reload_progress_display
@onready var ammo_lbl = $Info/Text/Ammo_Label
@onready var interact_panel = $InteractUiPanel
@onready var interact_label = $InteractUiPanel/ColorRect/Label

#Machete
@onready var machete_sprite = $Sprites/Machete
@onready var slash_effect = $Sprites/Slash_Effect

@export_category("Variable Class")
@export var speed = 300
@export var jump_velocity = -350.0
@export var acceleration : float = 15.0
@export var jump =1
@export var bullet_scence : PackedScene
@export var slash_scences : PackedScene
@export var player_name: String
@export var player_health : float
@export var player_armor : float
@export var player_biome : String
@export var world_root:NodePath
@export var is_machete_equip : bool
@export var is_burst_garou_equip : bool


@export_category("Bullets")
@export var player_ammo : int : set = set_max_ammo
@export var player_mag : int : set = set_max_reserved_ammo

@export_category(" Keys")
@export var pine_key :bool
@export var ice_key :bool
@export var stone_key : bool
@export var snow_fang_key : bool
@export var frozen_paw_securelock_key : bool
@export var grass_key : bool
@export var flower_key : bool
@export var ground_key : bool
@export var dessert_key : bool

enum state {
	IDDLE, 
	RUNNING,
	JUMPUP,
	JUMPDOWN,
	HURT,
	DIED,
	ATTACKMACHETE,
	SHOOT}

var coordinate = Data_Progress.new()
var current_ammo = player_ammo
var _reload_time := 3.5 : set = set_reload_time
var _fire_rate := 0.13 : set = set_fire_rate
var data = load(SAVE_DATA)
var anim_state = state.IDDLE
var current_health : float
var current_armor:float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _init():
	is_machete_equip = player_singleton_autoload.is_machete_equip
	is_burst_garou_equip = player_singleton_autoload.is_burst_garou_equip

	
func _ready():
	machete_sprite.visible = false
	brust_garou_sprite.visible = false
	slash_effect.visible = false
	interact_panel.visible = false
	hurt_area_chest.Eficient_Armors = 0.15
	hurt_area_foot.Eficient_Armors = 0.15
	
	if data is Data_Progress : 
		player_singleton_autoload.setter_name(data.player_name)
		player_singleton_autoload.setter_health(data.player_health)
		player_singleton_autoload.setter_location(data.player_biome_location)
		player_singleton_autoload.setter_armor(data.player_armor)
		player_singleton_autoload.setter_ammo_bullet(data.ammmo)
		player_singleton_autoload.setter_magazine_stock(data.mag)
		player_name = player_singleton_autoload.name_character
		player_health = player_singleton_autoload.health
		player_armor = player_singleton_autoload.armor
		player_biome = player_singleton_autoload.location
		player_ammo = player_singleton_autoload.ammo_bullets
		player_mag = player_singleton_autoload.magazine_stock
		pine_key = player_singleton_autoload.is_have_pine_key
		ice_key = player_singleton_autoload.is_have_ice_key
		stone_key = player_singleton_autoload.is_have_stone_key
		snow_fang_key = player_singleton_autoload.is_have_snow_fang_key
		frozen_paw_securelock_key = player_singleton_autoload.is_have_frozen_paw_securelook_key
		grass_key = player_singleton_autoload.is_have_grass_key
		flower_key = player_singleton_autoload.is_have_flower_key
		ground_key = player_singleton_autoload.is_have_ground_key
		dessert_key = player_singleton_autoload.is_have_dessert_key
		maganize_lbl.text=str(player_mag)
		bullets_caps_lbl.text = str(current_ammo)
		hurt_area_chest.Healths = player_health
		hurt_area_chest.Armors = player_armor
		hurt_area_foot.Healths = player_health
		hurt_area_foot.Armors= player_armor
	else:
		print("Failed to load resource data.")

	if is_burst_garou_equip == true:
		reloading_timer.connect("timeout",Callable(self,"refill_ammo"))	
		refill_ammo()
		maganize_lbl.text=str(player_mag)
		bullets_caps_lbl.text = str(current_ammo)

func update_state():
		if anim_state == state.HURT: 
			return
		if is_on_floor():
			if velocity == Vector2.ZERO:
				anim_state = state.IDDLE
			elif  velocity.x != 0:
				anim_state = state.RUNNING
		else: 
			if velocity.y <0 :
				anim_state = state.JUMPUP
			else:
				anim_state = state.JUMPDOWN
	
func update_animation(direction):
	# Turn Right
	if direction > 0 :
		player_Sprites.flip_h = false
	# turn Left
	elif direction <0:
		player_Sprites.flip_h = true
		
	match  anim_state:	
		#Iddle Normal
		state.IDDLE:
			if player_Sprites.flip_h:
				animation_player.play("Iddle_Flip")
			else:	
				animation_player.play("Iddle")
		#Normal Running
		state.RUNNING:
			if player_Sprites.flip_h:
				animation_player.play("Run_Flip")
			else:	
				animation_player.play("Run")
		#Riffle Running
		state.SHOOT:
			if player_Sprites.flip_h:
				animation_player.play("Run_Shoot_Flip")
			else:	
				animation_player.play("Run_Shoot")
			
		#Normal Jump	
		state.JUMPUP:
			if player_Sprites.flip_h:
				animation_player.play("Jump_Flip")
			else:
				animation_player.play("Jump")
			
		#Normal Fall
		state.JUMPDOWN:
			if player_Sprites.flip_h:
				animation_player.play("Fall_Flip")
			else:
				animation_player.play("Fall")
		
		#Hurt	
		state.HURT:
			if player_Sprites.flip_h:
				animation_player.play("Hurt_Flip")
			else:
				animation_player.play("Hurt")
		
		#Died
		state.DIED:
			if player_Sprites.flip_h:
				animation_player.play("Died_Flip")
			else:
				animation_player.play("Died")
			
		#Attack Machete
		state.ATTACKMACHETE:
			if player_Sprites.flip_h:
				animation_player.play("Machete_Attack_Flip")
			else:
				animation_player.play("Machete_Attack")

func add_health_armor():
	if player_health and player_armor< 100:
		current_health = player_health
		current_armor = player_armor
	else:
		print("Your Health and Armor was Max Capacity")
			
func _physics_process(delta):
	if DialogueManager.is_dialog_active:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	if anim_state == state.HURT: return
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x =  move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x =  move_toward(velocity.x,0, acceleration/2)
	
	coordinate.UpdatePos(self.position)
	emit_signal("update_coordinate",self.position)
	update_animation(direction)
	update_state()
	move_and_slide()

	var mouse_position = get_global_mouse_position()
	projectile.look_at(mouse_position)
	slash_effect.look_at(mouse_position)
	
	if not reloading_timer.is_stopped():
		return
		
	if Input.is_action_just_pressed("shoot_brust_garou") and is_burst_garou_equip ==true:
		if current_ammo > 0:
			anim_state = state.SHOOT
			animation_player.play()
			shoot()
		else: 
			ammo_empty_sfx.play()
	
	if Input.is_action_just_pressed("reloading") and current_ammo < player_mag and is_burst_garou_equip==true:
		reloading()
		
	if Input.is_action_just_pressed("slash_machete") and  player_singleton_autoload.is_machete_equip == true:
		anim_state = state.ATTACKMACHETE		
		animation_player.play()
		var slash_instance = slash_scences.instantiate()
		slash_instance.rotation = slash_effect.rotation
		slash_instance.global_position = slash_effect.global_position
		slash_instance.transform = slash_effect.global_transform
		get_tree().root.add_child(slash_instance)
		
	
	if Input.is_action_just_pressed("interaction"):
		var Wolves = hurt_area_foot.get_overlapping_bodies()
		for wolf in Wolves :
			if wolf.is_in_group("Wolves"):
				wolf.rescue()
			interact_label.set_text("Press " + "`Z`" + " to rescue the wolf")
			interact_panel.visible = true	
		
		#var Items = hurt_area_foot.get_overlapping_bodies():
		#for item in Items:
			#if item.is_in_group("item"):
				#print("Item picked up: ", item.name)
			
func shoot():
	if not shooting_timer.is_stopped():
		return
		
	current_ammo -= 1
	bullets_caps_lbl.text = str(player_ammo)
		
	var bullet_instance = bullet_scence.instantiate()
	bullet_instance.rotation = projectile.rotation
	bullet_instance.global_position = projectile.global_position
	bullet_instance.transform = projectile.global_transform
	get_tree().root.add_child(bullet_instance)
		
	SFX_Shoot.play()
	bullets_caps_lbl.text = str(current_ammo)
	shooting_timer.start(0.25 - _fire_rate)  # set according to your fire rate timing

	if player_ammo <= 0:
		ammo_empty_sfx.play()
	
func reloading():
	if player_mag <= 0:
		ammo_empty_sfx.play()
		return 
	
	reloading_voice_sfx.play()
	_on_reloading_voice_finished()
	reloading_riffle_sfx.play()
	reloading_timer.start(_reload_time)
	reloading_progress_display.show()
		
	var tween = create_tween()
	reloading_progress_bar.value = 0.0
	tween.tween_property(reloading_progress_bar, "value", 100.0, _reload_time)

func refill_ammo():
	var ammo_missing = player_ammo - current_ammo
	
	if player_mag >= ammo_missing:
		#reloading_voice_sfx.play()
		set_max_reserved_ammo(player_mag - ammo_missing)
		current_ammo = player_ammo
	else:
		current_ammo += player_mag
		set_max_reserved_ammo(0)	
		
	reloading_progress_display.visible = false
	bullets_caps_lbl.text = str(current_ammo)

func _on_reloading_voice_finished():
	reloading_riffle_sfx.play()

func set_max_ammo(value : int)-> void :
	player_ammo = value

func set_max_reserved_ammo(value: int)-> void:
	player_mag = value
	#maganize_lbl.text = str(player_mag)

func set_reload_time(value: float)-> void:
	_reload_time = value
	
func set_fire_rate(value: float)-> void :
	_fire_rate = value

func take_damage(damage:float,is_armor_piercing:bool,AP_dmg :float):
	var get_damages :  float
	
	#Armor_pricing Damage
	if is_armor_piercing:
		get_damages = damage
		player_armor = max(((damage * AP_dmg) * 0.15) - player_armor)
	
	# non Armor_pricing Damage
	else:
		get_damages = max(damage - player_armor,0)
		player_health -= get_damages
		
	# hurt Animation
	anim_state=state.HURT
	update_animation(0)
	
	if player_health <=0:
		died()
		
func died():
	anim_state = state.DIED
	
func _on_hurt_area_foot_area_entered(area):
	if area.is_in_group("trap"):
		var _traps = area.get_parent()
		take_damage(_traps.damage, _traps.is_have_AP_dmg, _traps.penetrate)

func _on_hurt_area_chest_area_entered(area):
	if area.is_in_group("enemy_hitbox"):
		var enemy = area.get_parent()
		print(take_damage(enemy.damage, enemy.AP, enemy.APdmg))
		take_damage(enemy.damage, enemy.AP, enemy.APdmg)

	if area.is_in_group("trap"):
		var _traps = area.get_parent()
		take_damage(_traps.damage, _traps._is_have_AP_dmg, _traps.penetrate)
		
func _on_animation_player_finished(anim_name):
	if anim_name == "Hurt":
		anim_state = state.IDDLE
		update_animation(0)
		
func _on_take_item(item: Node2D):
	# Handle the item pickup logic here
	if item.is_in_group("item"):
		# Example: Add item to inventory or apply its effect
		print("Item picked up: ", item.name)
		# You can add more logic here, such as adding the item to an inventory array
		# or applying its effect to the player.


func _on_sfx_reloading_voice_finished():
	reloading_riffle_sfx.play()
