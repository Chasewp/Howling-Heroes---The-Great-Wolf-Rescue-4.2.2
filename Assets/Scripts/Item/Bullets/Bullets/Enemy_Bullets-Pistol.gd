class_name Enemy_Bullets_Pistol
extends Hitboxes

@export var speed = 400
@onready var animation = $AnimatedSprite2D
var _has_exploded:bool = false

func _physics_process(delta):
	if not _has_exploded:
		animation.play("default")
		position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _process(delta):
	#Destroying bullets during get into terains tileset
	for body in self.get_overlapping_bodies():
		if body.is_in_group("Terains"):
			animation.play("explode")
			queue_free()
	
	#destroying bullets during get into enemy hurtbox
	for area in self.get_overlapping_areas():
		if area.is_in_group("player_hurt_box"):
			animation.play("explode")
			
func _ready():
	set_as_top_level(true)
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
