extends Control

var _exit_game_scene = load("res://Assets/Scences/UI/Exit_Game_Over/Exit_Game_Over.tscn")
var player = load("res://Assets/Scences/Character/Player/player.tscn")
var _game_over = null
@onready var  button_sfx = $Button_Sfx
@onready var game_over = $Mission_Failed

"Cursor"
var normal_cursor = load("res://Assets/Image/Cursor/Cursor 32x32.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")

func _ready():
	game_over.play()
	
func _exit_game():
	var exit_prosedure =  get_tree().root.get_node("World_Stages/UI/GameOver")
	_game_over = _exit_game_scene.instantiate()
	exit_prosedure.add_child(_game_over)
	
func _retry_game():
	var save_loader_manager = get_tree().root.get_node("World_Stages/Utilities/Save_Loader")
	var worlds = get_tree().root.get_node("World_Stages")
	game_over = player.instantiate()
	worlds.add_child(game_over)
	save_loader_manager.has_method("load_game")
	player_singleton_autoload.setter_health(100)
	player_singleton_autoload.setter_armor(100)
	player_singleton_autoload.setter_ammo_bullet(30)
	player_singleton_autoload.setter_magazine_stock(150)
	queue_free()

func on_mouse_entered()-> void:
	Input.set_custom_mouse_cursor(hand_cursor)
	
func on_mouse_exited()->void:
	Input.set_custom_mouse_cursor(normal_cursor)
