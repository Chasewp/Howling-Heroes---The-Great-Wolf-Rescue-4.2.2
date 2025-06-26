class_name ArrowTrapProjectile
extends Hitboxes

@export var speed := 500.0
@export var is_homing := false
@export var homing_strength := 2.0
@export var max_distance := 200.0  # Maximum travel distance in pixels

var direction := Vector2.RIGHT
var target : Node2D = null
var distance_traveled := 0.0
var spawn_position := Vector2.ZERO

func setup(dir: Vector2, spd: float, dmg: float):
	direction = dir.normalized()
	speed = spd
	damage = dmg
	rotation = direction.angle()
	spawn_position = global_position
	
	if is_homing:
		target = get_tree().get_first_node_in_group("player")
		if target:
			$HomingTimer.start()

func _physics_process(delta):
	# Calculate movement
	var movement = direction * speed * delta
	
	# Apply homing if enabled
	if is_homing and target:
		var target_dir = (target.global_position - global_position).normalized()
		direction = direction.lerp(target_dir, homing_strength * delta)
		rotation = direction.angle()
		movement = direction * speed * delta
	
	# Update position and distance
	position += movement
	distance_traveled += movement.length()
	
	# Destroy if beyond max range
	if distance_traveled >= max_distance:
		queue_free()
	
	# Alternative range check method (uncomment if preferred)
	#if global_position.distance_to(spawn_position) >= max_distance:
	#    queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage, false, 0.0)
	queue_free()
			
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
