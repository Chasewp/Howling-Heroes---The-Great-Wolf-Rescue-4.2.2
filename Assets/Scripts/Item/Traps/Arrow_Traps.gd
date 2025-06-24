# arrow_trap_projectile.gd
class_name ArrowTrapProjectile
extends Hitboxes

@export var speed := 500.0
@export var is_homing := false
@export var homing_strength := 2.0

var direction := Vector2.RIGHT
var target : Node2D = null

# Modified setup function to match what the trap is calling
func setup(dir: Vector2, spd: float, dmg: float):
	direction = dir.normalized()
	speed = spd
	damage = dmg
	rotation = direction.angle()
	
	# Optional homing setup
	if is_homing:
		target = get_tree().get_first_node_in_group("player")
		if target:
			$HomingTimer.start()

func _physics_process(delta):
	if is_homing and target:
		var target_dir = (target.global_position - global_position).normalized()
		direction = direction.lerp(target_dir, homing_strength * delta)
		rotation = direction.angle()
	
	position += direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage, false, 0.0)
	queue_free()
