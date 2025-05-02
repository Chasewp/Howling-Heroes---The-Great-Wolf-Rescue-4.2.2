extends Control

@onready var  button_sfx = $Button_Sfx
@onready var game_over = $Mission_Failed


"Cursor"
var normal_cursor = load("res://Assets/Image/Cursor/Cursor 32x32.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")

func _ready():
	game_over.play()
	
func _exit_game():
	LoadingScreen.load_scence("res://Assets/Scences/UI/Exit_Game_Over/Exit_Game_Over.tscn")
	
func _retry_game():
	LoadingScreen.load_scence("res://Assets/Scences/UI/Character_Name/Player_Name.tscn")

func on_mouse_entered()-> void:
	Input.set_custom_mouse_cursor(hand_cursor)
	
func on_mouse_exited()->void:
	Input.set_custom_mouse_cursor(normal_cursor)
