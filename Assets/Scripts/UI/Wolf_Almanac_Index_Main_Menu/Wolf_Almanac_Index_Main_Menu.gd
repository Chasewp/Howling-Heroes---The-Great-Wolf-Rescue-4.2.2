class_name Wolf_Almanac_Main_Menu
extends Control

@onready var button_click = $Button_Click
var _cursor_hand = load("res://Assets/Image/Cursor/hand_paw.png")
var _cursor_normal = load("res://Assets/Image/Cursor/Cursor 32x32.png")


var _page1Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 1/Wolf_Almanac_Index_Page_1.tscn")
var _page2Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 2/Wolf_Alamac_Index_Page_2.tscn")
var _page3Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 3/Wolf_Alamac_Index_Page_3.tscn")
var _page4Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 4/Wolf_Alamac_Index_Page_4.tscn")
var _page5Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 5/Wolf_Alamac_Index_Page_5.tscn")
var _page6Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 6/Wolf_Alamac_Index_Page_6.tscn")
var _page7Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 7/Wolf_Alamac_Index_Page_7.tscn")
var _page8Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 8/Wolf_Alamac_Index_Page_8.tscn")
var _page9Menu = load("res://Assets/Scences/UI/Wolf_Almanac/Index/Page 9/Wolf_Alamac_Index_Page_9.tscn")


func _on_page_1_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page1Menu
	AlmanacOpenCloser.page = "1"
	AlmanacOpenCloser.open_wolf_page_almanac()
	
func _on_page_2_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page2Menu
	AlmanacOpenCloser.page = "2"
	AlmanacOpenCloser.open_wolf_page_almanac()
	
func _on_page_3_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page3Menu
	AlmanacOpenCloser.page = "3"
	AlmanacOpenCloser.open_wolf_page_almanac()
	
func _on_page_4_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page4Menu
	AlmanacOpenCloser.page = "4"
	AlmanacOpenCloser.open_wolf_page_almanac()

func _on_page_5_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page5Menu
	AlmanacOpenCloser.page = "5"
	AlmanacOpenCloser.open_wolf_page_almanac()

func _on_page_6_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page6Menu
	AlmanacOpenCloser.page = "6"
	AlmanacOpenCloser.open_wolf_page_almanac()

func _on_page_7_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page7Menu
	AlmanacOpenCloser.page = "7"
	AlmanacOpenCloser.open_wolf_page_almanac()
	
func _on_page_8_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page8Menu
	AlmanacOpenCloser.page = "8"
	AlmanacOpenCloser.open_wolf_page_almanac()

func _on_page_9_pressed():
	button_click.play()
	AlmanacOpenCloser.wolf_almanac_scene = _page9Menu
	AlmanacOpenCloser.page = "9"
	AlmanacOpenCloser.open_wolf_page_almanac()
	
func _cursor_entered():
	Input.set_custom_mouse_cursor(_cursor_hand)

func _cursor_exited():
	Input.set_custom_mouse_cursor(_cursor_normal)

func _process(_delta):
	if Input.is_action_just_pressed("open_wolf_almanac"):  
		toggle_wolf_almanac()
				
func toggle_wolf_almanac():
	self.visible = !self.visible
	get_tree().paused = self.visible 
