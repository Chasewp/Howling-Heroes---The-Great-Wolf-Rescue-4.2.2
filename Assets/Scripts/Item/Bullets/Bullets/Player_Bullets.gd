class_name Brust_Garou_bullets 
extends Hitboxes

@export var speed = 300
@onready var animation = $AnimatedSprite2D
var _has_exploded:bool = false

func _physics_process(delta):
	if not _has_exploded:
		animation.play("default")
		position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _ready():
	set_as_top_level(true)
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

