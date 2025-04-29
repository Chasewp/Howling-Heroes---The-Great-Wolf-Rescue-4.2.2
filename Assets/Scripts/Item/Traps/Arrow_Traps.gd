# arrow_trap_projectile.gd
class_name ArrowTrapProjectile
extends Hitboxes

@export var speed := 500.0
@export var is_homing := false
@export var homing_strength := 2.0

@onready var HomingTimer = $HomingTimer

var direction := Vector2.RIGHT
var target : Node2D

func setup(shoot_direction: Vector2, homing_target: Node2D = null):
	direction = shoot_direction.normalized()
	rotation = direction.angle()
	target = homing_target
	if is_homing and target:
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

func _on_homing_timer_timeout():
	if !target:
		is_homing = false
