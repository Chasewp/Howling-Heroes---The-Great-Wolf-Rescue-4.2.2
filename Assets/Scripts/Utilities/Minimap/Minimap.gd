extends SubViewportContainer

@onready var camera = $SubViewport/Camera2D
@onready var playier : Player_controlled = get_tree().get_first_node_in_group("player")



func _process(_delta):
	camera.position = playier.position
	
