extends Area2D

@onready var animation = $AnimationPlayer

func _ready():
	animation.play("iddle")
	
func _on_body_entered(body:Node2D):
	if body as Player_controlled:
		if player_singleton_autoload.health <100:
			player_singleton_autoload.health = +25.0
			animation.play("pickup")
			queue_free()
		else:
			animation.play("iddle")
			print("The Armor and Health was full")
	
