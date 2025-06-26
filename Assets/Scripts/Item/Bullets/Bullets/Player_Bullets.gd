class_name Brust_Garou_bullets 
extends Hitboxes

@export var speed = 300
@onready var animation = $AnimatedSprite2D
var has_hit := false
var processed_hits := []  # Track enemies we've already hit

func _physics_process(delta):
	animation.play("default")
	position += (Vector2.RIGHT*speed).rotated(rotation)*delta

func _ready():
	set_as_top_level(true)
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("enemy_hurtbox") and not has_hit:
		var enemy = area.get_parent()
		if enemy and not enemy in processed_hits:
			processed_hits.append(enemy)
			has_hit = true
			queue_free()

func _on_body_entered(body):
	if body.is_in_group("Terains"):
		queue_free()
