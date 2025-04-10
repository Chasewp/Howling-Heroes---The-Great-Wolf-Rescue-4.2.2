extends Control

var _exit_game_scene = load("res://Assets/Scences/UI/Exit_Game_Over/Exit_Game_Over.tscn")
var _game_over = null

func _exit_game():
	var exit_prosedure =  get_tree().root.get_node("World_Stages/UI/GameOver")
	_game_over = _exit_game_scene.instantiate()
	exit_prosedure.add_child(_game_over)
	
func _retry_game():
	var save_loader_manager = get_tree().root.get_node("World_Stages/Utilities/Save_Loader")
