class_name Level
extends Node2D

signal exit_reached(next_level:String)

var crosshair_Cursor = load("res://Assets/Image/Cursor/Cross_Hair/Layer 1.png")
@export_file("*.tscn") var next_level:String

func _ready():
	Input.set_custom_mouse_cursor(crosshair_Cursor)
	
	# Connect all level exit areas
	var level_exits = get_tree().get_nodes_in_group("level_exit")
	for exit in level_exits:
		if exit.has_signal("body_entered"):
			exit.body_entered.connect(_on_level_exit_entered.bind(exit))
		else:
			push_warning("Exit area ", exit.name, " doesn't have body_entered signal")

func _on_level_exit_entered(body, exit):
	if body.is_in_group("player"):
		exit_reached.emit(next_level)
