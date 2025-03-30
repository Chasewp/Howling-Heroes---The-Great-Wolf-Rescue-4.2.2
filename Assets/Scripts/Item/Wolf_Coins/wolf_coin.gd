extends Node2D

@onready var animate = $AnimatedSprite2D/AnimationPlayer
signal exit_reached()

func _ready():
	animate.play("Flip")

func _on_body_entered(body):
	if body.is_in_group("player"):
		animate.play("Fanish")
		exit_reached.emit()
