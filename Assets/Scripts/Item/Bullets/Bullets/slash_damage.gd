class_name Slash_Damage
extends Hitboxes

@export var speed = 250
@onready var animation = $AnimationPlayer
func _physics_process(delta):
		animation.play("default")
		position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _ready():
	set_as_top_level(true)
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
