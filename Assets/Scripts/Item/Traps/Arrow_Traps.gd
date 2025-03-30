extends Node2D

@onready var arrow = $Arrow
@onready var launcher = $Launcher/shoot
var arrow_speed = 200

func _process(delta):
	arrow.translate(Vector2.LEFT * arrow_speed * delta)

func _on_SpikeEnd_area_entered(area):
	if area == arrow:
		arrow.global_position = launcher.global_position
		# Replace with function body.
