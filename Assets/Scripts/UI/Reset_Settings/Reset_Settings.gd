extends Control

@onready var Warning = $Warning
@onready var button_sound = $"buton sound"
"Cursor"
var normal_cursor = load("res://Assets/Image/Cursor/Cursor 32x32.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	Warning.play()
	
func _on_confirmation_dialog_confirmed():
	button_sound.play()
	GlobalSettings._toggle_fullscreen(false)
	GlobalSettings._toggle_vsync(false)
	GlobalSettings._update_master_Volume(0)
	GlobalSettings._update_music_Volume(0)
	GlobalSettings._update_SFX_Volume(0)
	GlobalSettings._update_dialogue_Volume(0)
	LoadingScreen.load_scence("res://Assets/Scences/UI/Main_Menu/main_menu.tscn")
	

func _on_confirmation_dialog_canceled():
	button_sound.play()
	SaveSettings.Data_Settings.FullScreen_on
	SaveSettings.Data_Settings.V_Sync_on
	SaveSettings.Data_Settings.Master_Volume
	SaveSettings.Data_Settings.Music_Volume
	SaveSettings.Data_Settings.SFX_Volume
	SaveSettings.Data_Settings.Dialogue_Volume
	LoadingScreen.load_scence("res://Assets/Scences/UI/Options/Options_Menu.tscn")

func on_mouse_entered()-> void:
	Input.set_custom_mouse_cursor(hand_cursor)
	
func on_mouse_exited()->void:
	Input.set_custom_mouse_cursor(normal_cursor)
