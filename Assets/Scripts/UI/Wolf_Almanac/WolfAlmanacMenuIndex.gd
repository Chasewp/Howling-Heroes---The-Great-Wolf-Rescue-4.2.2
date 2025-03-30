class_name Wolf_Almanac_Main_Menu_Index
extends Node

@onready var button_sfx = $Button_Click
var _cursor_hand = load("res://Assets/Image/Cursor/hand_paw.png")
var _cursor_normal = load("res://Assets/Image/Cursor/Cursor 32x32.png")

#quit Wolf Wolf Almanac Index
func _on_back_button_pressed()->void:
	button_sfx.play()
	AlmanacOpenCloser.close_wolf_almanac()
	
func _cursor_entered():
	Input.set_custom_mouse_cursor(_cursor_hand)

func _cursor_exited():
	Input.set_custom_mouse_cursor(_cursor_normal)
