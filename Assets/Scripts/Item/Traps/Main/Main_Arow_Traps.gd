class_name ArrowTrapBase  # Renamed to reflect upward shooting
extends StaticBody2D

@export var arrow_scene : PackedScene
@export var shoot_interval := 2.0
@export var triple_shot := false
@export var is_destructible := true
@export var health := 30.0

@onready var shoot_timer = $ShootTimer
@onready var shoot_point = $ShootPoint
@onready var detection_ray = $TurretRaycast
@onready var sprite = $Sprite2D

var target_player : CharacterBody2D
var can_see_player := false

func _ready():
	# Default rotation to face up (270 degrees)
	sprite.rotation_degrees = 270
	shoot_point.rotation_degrees = 270
	
	# Find player
	target_player = get_tree().get_first_node_in_group("player")
	if not target_player:
		push_warning("ArrowTrap: Player not found!")
	
	shoot_timer.wait_time = shoot_interval
	shoot_timer.start()
	
	# Configure raycast (pointing up)
	detection_ray.target_position = Vector2(0, -300)  # Upwards
	detection_ray.add_exception(self)  # Don't detect self

func _physics_process(delta):
	if not target_player:
		return
	
	# Update raycast position
	detection_ray.force_raycast_update()
	
	# Check if player is visible
	can_see_player = false
	if detection_ray.is_colliding():
		var collider = detection_ray.get_collider()
		if collider == target_player:
			can_see_player = true

func shoot():
	if not can_see_player:  # Only shoot if player is visible
		return
	
	var bullet = arrow_scene.instantiate()
	
	# Set upward direction (0,-1 is up in Godot)
	bullet.direction = Vector2.UP
	bullet.rotation = Vector2.UP.angle()  # Point upwards
	bullet.global_position = shoot_point.global_position
	
	get_parent().add_child(bullet)  # Add to parent, not root

func _on_shoot_timer_timeout():
	if triple_shot:
		for i in 3:
			shoot()
			await get_tree().create_timer(0.1).timeout
	else:
		shoot()

func take_damage(amount: float):
	if !is_destructible:
		return
	
	health -= amount
	$HitAnimation.play("hit")
	
	if health <= 0:
		queue_free()
