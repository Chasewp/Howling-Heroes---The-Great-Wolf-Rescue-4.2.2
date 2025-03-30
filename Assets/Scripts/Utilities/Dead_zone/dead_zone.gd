extends Area2D

var checkpoint_manager
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("Player")

func _on_body_entered(body):
	if body.is_in_group("player"):
		_executed_player()
		
func _executed_player():
	player.position = checkpoint_manager.last_location
