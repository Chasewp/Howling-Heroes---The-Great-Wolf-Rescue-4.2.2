extends Control

#variable nodes
@onready var backsound = $Back_Sound
@onready var startbtn = $StartBtn
@onready var normalbutton = $Normal_button
@onready var alertsound = $Alert
@onready var _continue_button = $"Background/Continue Button"
var save_load = SaveLoadManagerFile.new()
@onready var notification_panel = $AcceptDialog
"Cursor"
var normal_cursor = load("res://Assets/Image/Cursor/Cursor 32x32.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")

func _ready():
	notification_panel.visible = false
	backsound.play()
	if save_load.save_file_exist() == false:
		_continue_button.disabled = true
		
#New Game Button
func _on_new_game_main_menu_buttons_pressed():
	if save_load.save_file_exist() == true:
		startbtn.play()
		_continue_button.disabled = true
		notification_panel.visible = true
		alertsound.play()
	else:
		startbtn.play()
		LoadingScreen.load_scence("res://Assets/Scences/UI/Suggestion/suggestion.tscn")
	

#Continue Game Button
func _on_continue_main_menu_buttons_pressed():
	startbtn.play()
	if save_load.save_file_exist()== true:
		LoadingScreen.load_scence("res://Assets/Scences/Stages/Worlds/world_stages.tscn")
	else :
		print("Failed open stage")
	
#Options Button
func _on_options_main_menu_buttons_pressed():
	LoadingScreen.load_scence("res://Assets/Scences/UI/Options/Options_Menu.tscn")
	normalbutton.play()

#Quit Button
func _on_quit_main_menu_buttons_pressed():
	get_tree().change_scene_to_file("res://Assets/Scences/UI/Exit_Confirmation/Exit_Confirmation.tscn")
	normalbutton.play()

#Credits Button
func _on_credits_pressed():
	normalbutton.play()
	LoadingScreen.load_scence("res://Assets/Scences/UI/Credits/credit_1.tscn")

#FurAfinity
func _on_furafinity_pressed():
	normalbutton.play()
	OS.shell_open("https://www.furaffinity.net/user/mariqblizzardwp03")

#Github
func _on_github_pressed():
	normalbutton.play()
	OS.shell_open("https://github.com/Chasewp/Howling-Heroes---The-Great-Wolf-Rescue-4.2.1")
	
#Discord Server
func _on_discord_pressed():
	normalbutton.play()
	OS.shell_open("https://discord.gg/t5NPDvTZKd")

func on_mouse_entered()-> void:
	Input.set_custom_mouse_cursor(hand_cursor)
	
func on_mouse_exited()->void:
	Input.set_custom_mouse_cursor(normal_cursor)

func _on_accept_dialog_confirmed():
	LoadingScreen.load_scence("res://Assets/Scences/UI/Suggestion/suggestion.tscn")
	startbtn.play()
	save_load.new_game()
	WolfData.reset_Wolf_Rescue_data()
