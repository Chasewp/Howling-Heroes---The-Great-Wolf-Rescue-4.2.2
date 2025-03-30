extends Area2D

@onready var animation = $AnimationPlayer

var player_in_range = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		body.interact_panel.visible = true
		body.interact_label.text = "Press 'Z' to pick up"
		print(player_in_range)
	
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		body.interact_panel.visible = false
		animation.play("iddle")
		print(player_in_range)
		
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interaction"):
		# Emit signal to player to take this item
		get_tree().call_group("player", "take_item", self)
		player_singleton_autoload.setter_machete_equip(true)
		animation.play("Pick_up")
		queue_free()  # Remove the item from the scene after picking it up
		print(player_singleton_autoload.getter_machete_equip())
