class_name ArrowTrapTop
extends StaticBody2D

enum FireMode {
	SINGLE,     # Single shot
	RAPID,      # Rapid fire sequence
	BURST,      # Burst fire (multiple shots at once)
	SHOTGUN     # Spread pattern
}

@export_category("Projectile Settings")
@export var arrow_scene : PackedScene
@export var projectile_speed := 300.0
@export var projectile_damage := 10.0

@export_category("Firing Behavior") 
@export var fire_mode: FireMode = FireMode.SINGLE
@export var shoot_interval := 2.0
@export var shots_per_burst := 3
@export var burst_delay := 0.1
@export var shotgun_spread := 30.0 # degrees
@export var shotgun_pellets := 5

@export_category("Detection Settings")
@export var use_raycast := true
@export var raycast_length := 300.0
@export var auto_fire := false

@export_category("Destructible")
@export var is_destructible := true
@export var health := 30.0

@onready var shoot_timer = $ShootTimer
@onready var shoot_point = $ShootPoint
@onready var detection_ray = $TurretRaycast
@onready var animation_arrow = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D

@export var target_player : CharacterBody2D
var can_see_player := false

func _ready():
	target_player = get_tree().get_first_node_in_group("player")
	if not target_player:
		push_warning("ArrowTrap: Player not found!")
	
	configure_trap()
	set_physics_process(true)

func configure_trap():
	shoot_timer.wait_time = shoot_interval
	shoot_timer.start()
	
	# Configure raycast with debug
	detection_ray.target_position = Vector2(0, -raycast_length)
	detection_ray.add_exception(self)
	

func _physics_process(delta):
	if not target_player:
		target_player = get_tree().get_first_node_in_group("player")
		return
	
	if use_raycast:
		detection_ray.force_raycast_update()
		can_see_player = false
		
		if detection_ray.is_colliding():
			var collider = detection_ray.get_collider()
			detection_ray.debug_shape_custom_color = Color(1, 0, 0, 0.5) # Red when colliding
			if collider == target_player:
				can_see_player = true
				if animation_arrow:
					animation_arrow.play("shoot")
		else:
			detection_ray.debug_shape_custom_color = Color(0, 1, 0, 0.5)
	else:
		can_see_player = true
		
func shoot():
	if use_raycast and not can_see_player:
		return
	
	match fire_mode:
		FireMode.SINGLE:
			fire_single()
		FireMode.RAPID:
			fire_rapid()
		FireMode.BURST:
			fire_burst()
		FireMode.SHOTGUN:
			fire_shotgun()

func fire_single():
	var bullet = create_projectile(Vector2.UP)
	get_parent().add_child(bullet)

func fire_rapid():
	for i in range(shots_per_burst):
		var bullet = create_projectile(Vector2.UP)
		get_parent().add_child(bullet)
		await get_tree().create_timer(burst_delay).timeout

func fire_burst():
	for i in range(shots_per_burst):
		var bullet = create_projectile(Vector2.UP)
		get_parent().add_child(bullet)

func fire_shotgun():
	var angle_step = shotgun_spread / (shotgun_pellets - 1)
	var start_angle = -shotgun_spread / 2.0
	
	for i in range(shotgun_pellets):
		var angle = deg_to_rad(start_angle + (i * angle_step))
		var direction = Vector2.UP.rotated(angle)
		var bullet = create_projectile(direction)
		get_parent().add_child(bullet)

func create_projectile(direction: Vector2) -> Node2D:
	var bullet = arrow_scene.instantiate()
	
	# Modified to match the new setup function
	if bullet.has_method("setup"):
		bullet.setup(direction, projectile_speed, projectile_damage)
	else:
		bullet.direction = direction
		bullet.speed = projectile_speed
		bullet.damage = projectile_damage
	
	bullet.global_position = shoot_point.global_position
	bullet.rotation = direction.angle()
	
	return bullet

func _on_shoot_timer_timeout():
	if auto_fire or (use_raycast and can_see_player):
		shoot()

func take_damage(amount: float):
	if !is_destructible:
		return
	
	health -= amount
	$HitAnimation.play("hit")
	
	if health <= 0:
		queue_free()
