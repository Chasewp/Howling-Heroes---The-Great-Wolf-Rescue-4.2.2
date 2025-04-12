class_name Game_Manager
extends Node2D

@onready var stage_root : WorldRoot = %WorldRoot
@onready var save_load :SaveLoadManagerFile =%Save_Loader
@onready var button_sfx = $UI/butons_sfx
var crosshair_Cursor = load("res://Assets/Image/Cursor/Cross_Hair/Layer 1.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")

func _ready():
	stage_root.level_exit_reached.connect(_on_level_exit_reached)
	
	
func _on_level_exit_reached(next_level):
	stage_root.load_level_async(next_level)

func _process(delta):
	pass
	
	#if Input.is_action_just_pressed("pause"):
		#_pause(not _paused)
#
			#
#func _pause(value:bool):
	#_paused = value
	#_pause_screen.visible = _paused
	#get_tree().paused = _paused


## ------------------------------------------------------------------------------------

# Called when the save game button is pressed
func _on_save_game():
	print("Save game!")
	save_load.save_game()
	button_sfx.play()

# Called when the load game button is pressed
func _on_load_game():
	print("Load game!")
	save_load.load_game()
	button_sfx.play()
	
func _on_enter_button():
	Input.set_custom_mouse_cursor(hand_cursor)

func _on_exit_button():
	Input.set_custom_mouse_cursor(crosshair_Cursor)
