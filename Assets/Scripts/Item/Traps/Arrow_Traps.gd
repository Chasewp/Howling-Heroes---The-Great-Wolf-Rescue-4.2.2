class_name ArrowTrapProjectile
extends Hitboxes

@export var speed := 500.0
@export var is_homing := false
@export var homing_strength := 2.0

var direction := Vector2.RIGHT
var target : Node2D = null

func setup(dir: Vector2, spd: float, dmg: float):
	direction = dir.normalized()
	speed = spd
	damage = dmg
	rotation = direction.angle()
	
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
	
	# Update position
	position += movement

func _on_body_entered(body):
	# Only disappear if hitting player or terrain
	if body.is_in_group("player") or body.is_in_group("Terrain"):
		if body.is_in_group("player"):
			body.take_damage(damage, false, 0.0)
		queue_free()
			
func _on_visible_on_screen_enabler_2d_screen_exited():
	# Remove the screen exit check if you want arrows to persist off-screen
	# Or keep it if you want them to disappear when off-screen
	queue_free()
