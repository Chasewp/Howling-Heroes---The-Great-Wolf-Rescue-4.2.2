class_name bos_2_spawner
extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for boss2 in get_tree().get_nodes_in_group("bos2"):
		boss2.global_position = global_position

