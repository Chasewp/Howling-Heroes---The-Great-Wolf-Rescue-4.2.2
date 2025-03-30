extends Area2D

@onready var animation = $AnimationPlayer

func _on_body_entered(body:Node2D):
	if body as Player_controlled:
		if body.player_health and body.player_armor <100:
			player_singleton_autoload.health = +25.0
			player_singleton_autoload.armor = +25.0
			queue_free()
		else:
			print("The Armor and Health was full")
	
