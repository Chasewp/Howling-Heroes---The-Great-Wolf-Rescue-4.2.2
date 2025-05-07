class_name Enemy_Arrow
extends Hitboxes

@export var speed = 250
@onready var animation = $Arrow
var _has_exploded:bool = false

func _physics_process(delta):
	if not _has_exploded:
		animation.play("default")
		position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _ready():
	set_as_top_level(true)
	area_entered.connect(Callable(self,"on_area_inbound"))
	body_entered.connect(Callable(self,"on_body_inbound"))
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	

func on_area_inbound(area):
	if area.is_in_group("player_hurtbox"):
			has_hit = true
			queue_free()

func on_body_inbound(body):
	if body.is_in_group("Terains"):
			queue_free()
