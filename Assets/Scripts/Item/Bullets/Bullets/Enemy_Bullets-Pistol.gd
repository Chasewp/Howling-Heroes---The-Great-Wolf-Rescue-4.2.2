class_name Enemy_Bullets_Pistol
extends Hitboxes

@export var speed = 400
@onready var animation = $AnimatedSprite2D
var has_hit := false

func _physics_process(delta):
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
