class_name player_spawner
extends Marker2D

func _ready():
	for player in get_tree().get_nodes_in_group("player"):
		player.global_position = global_position

