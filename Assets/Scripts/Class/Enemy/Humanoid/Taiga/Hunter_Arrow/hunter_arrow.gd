class_name Hunter_Arrow_Enemy
extends Enemy_Main_Class


@onready var AttackTimer = $AttackTimer
@onready var projectile = $Arrow_Show
@onready var bos_hunter_bow_sprite = $Hunter_Sprites
@onready var bos_hunter_bow_animations  = $Hunter_Sprites/AnimationPlayer
@onready var sensor = $Sensoric
@onready var chase_timer = $ChaseTimer

@export_category("Data Class")
@export var arrow_scence: PackedScene
@export var rapid_fire_count: int = 5  # Jumlah anak panah dalam rapid fire
@export var rapid_fire_interval: float = 0.2  # Interval antar anak panah (dalam detik)
@export var attack_cooldown: float = 3.0  # Cooldown setelah rapid fire selesai (dalam detik)



var is_attacking: bool = false

func _ready():
	# Cari player di scene
	target_player = get_tree().get_nodes_in_group("player")[0]
	# Mulai serangan berkala
	AttackTimer.wait_time = attack_cooldown
	AttackTimer.start()
	left_bounds = self.position + range_left_bound
	right_bounds = self.position + range_right_bound
	
func _physics_process(delta):
	handle_gravity(delta)
	handle_movement(delta)
	update_animaton(delta)
	update_state()
	look_for_player()
	
func look_for_player():
	if sensor.is_colliding():
		var collider = sensor.get_collider()
		if  collider == target_player:
			chase_player()
		elif animate_state == state.RUNNING:
			stop_chase()
	elif  animate_state == state.RUNNING:
		stop_chase()
		

func _on_attack_timer_timeout():
	if target_player:
		start_rapid_fire()

func start_rapid_fire():
	if not is_attacking:
		is_attacking = true
		for i in range(rapid_fire_count):
			shoot_arrow()
			await get_tree().create_timer(rapid_fire_interval).timeout  # Tunggu interval antar anak panah
		is_attacking = false

func shoot_arrow():
	if arrow_scence:
		var arrow_instance = arrow_scence.instantiate()
		arrow_instance.global_position = global_position  # Posisi awal anak panah
		arrow_instance.direction = (target_player.global_position - global_position).normalized()  # Arah ke player
		get_parent().add_child(arrow_instance)  # Tambahkan anak panah ke scene

func update_state():
		if animate_state == state.HURT: 
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

func update_animaton(direction):
	# Turn Right
	if direction > 0:
		bos_hunter_bow_sprite.flip_h = false
	# Turn Left
		bos_hunter_bow_sprite.flip_h = true
	
	match animate_state:
			#Iddle 
			state.IDDLE:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("iddle_flip")
				else:
					bos_hunter_bow_animations.play("iddle")
			# Running
			state.RUNNING:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("running_flip")
				else:
					bos_hunter_bow_animations.play("running")
			# Jump
			state.JUMPUP:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("jump_up_flip")
				else:
					bos_hunter_bow_animations.play("jump_up")
			#Fall
			state.JUMPDOWN:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("jump_down_Flip")
				else:
					bos_hunter_bow_animations.play("jump_down")
			# Hurt	
			state.HURT:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("hurt_Flip")
				else:
					bos_hunter_bow_animations.play("hurt")
			# Died	
			state.DIED:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("died")
				else :
					bos_hunter_bow_animations.play("died")
			state.ATTACK:
				if bos_hunter_bow_sprite.flip_h:
					bos_hunter_bow_animations.play("attack_flip")
				else:
					bos_hunter_bow_animations.play("attack")
func died():
	MissionStatData.update_boss_kills()
	animate_state = state.DIED

func chase_player():
	chase_timer.stop()
	animate_state=state.RUNNING
	
	
func stop_chase():
	if chase_timer.time_left <=0:
		chase_timer.start()
		
func _on_chase_timer_timeout():
	animate_state = state.RUNNING
