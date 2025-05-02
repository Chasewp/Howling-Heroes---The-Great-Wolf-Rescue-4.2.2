class_name Enemy_Arrow
extends Hitboxes

@export var speed = 250
@onready var animation = $Arrow
var _has_exploded:bool = false

func _physics_process(delta):
	if not _has_exploded:
		animation.play("default")
		position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _process(delta):
	#destroying bullets during get into enemy hurtbox
	for area in self.get_overlapping_areas():
		if area.is_in_group("player_hurtbox"):
			queue_free()
			
func _ready():
	set_as_top_level(true)
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
