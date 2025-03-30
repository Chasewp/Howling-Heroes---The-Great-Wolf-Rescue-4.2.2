class_name bos_1_spawner
extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for boss1 in get_tree().get_nodes_in_group("bos1"):
		boss1.global_position = global_position

