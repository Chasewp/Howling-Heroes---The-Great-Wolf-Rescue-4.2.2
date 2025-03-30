"""Arrow Bullet"""
class_name Arrow_Boss_Hunter_Arrow
extends RigidBody2D

@export_category("Arrow_Stats")
@export var speed : float
@export var AP_dmg : float
@export var damage : float
@export var penetrate : bool

var _direction : Vector2 = Vector2.RIGHT

func _ready():
	rotation = _direction.angle()
	linear_velocity = _direction * speed
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	#Attack Player
	if body.is_in_group("player"):
		body.take_0d0amage(damage, AP_dmg, penetrate)
		queue_free()
	else:
		#Delete Arrow if get obsicles
		queue_free()
