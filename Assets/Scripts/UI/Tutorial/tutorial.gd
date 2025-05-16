extends Node2D

#Scences node
@onready var sfxalert = $sfx_alert
@onready var dialogmenu = $Dialogue_sfx
@onready var background = $background
@onready var dialogue_text = $dialog
@onready var dialogueleave = $Dialogue_leave_tutorial
@onready var dialogejoin = $Dialogue_join_tutorial
@onready var dialogenarator = $Dialogue_narator
@onready var wordstilesets = $tilesets
@onready var keyhintlbl = $Key_hint
# Mr Wolf
@onready var mrwolf= $Mr_Wolf
@onready var mrwolflabeldialog = $"Mr Wolf Label"
#Weapons
@onready var machete = $Machete
@onready var brustgarouriffle = $Brust_garaou
#Player & red fox
@onready var redfox = $Red_fox
@onready var player = $Player
@onready var playercoordinateandammo = $Player/Info
@onready var playerinteractpane = $Player/InteractUiPanel
@onready var playerhealtandarmorbar = $"Player/Progress bar"
#Gui, Mission Log, & Wolf Almanac Index Menu
@onready var gui = $GuiPlay
@onready var mission_logs= $Mission
@onready var wolfalmanacmenuindex = $Almanac_Main_Menu

var tutorial_steps :=[
	#0
	{"text":"Welcome, esteemed adventurers! I am Mr. Wolf, Your esteemed guide. It is my honor to provide an explanation of the intricacies of `Howling Heroes: The Great Wolf Rescue.` Kindly press the [wave amp=45 freq=3][b]Z[/b][/wave] key to [b]move on to the next dialogue or interaction[/b].", "voice":"res://Assets/Music/Dialogues/How to Play/How to Play 1.mp3","key":"interaction"},
	#1
	{"text":"To [b]advance forward[/b], utilize the [wave amp=45 freq=3][b]D[/b][/wave] key.","voice":"res://Assets/Music/Dialogues/How to Play/How to Play 3.mp3","key":"move_right"},
	#2
	{"text":"To [b]perform a jump[/b], please press the [wave amp=45 freq=3][b]W[/b][/wave] key.","voice":"res://Assets/Music/Dialogues/How to Play/How to Play 2.mp3","key":"jump"},
	#3
	{"text":"Utilize the [wave amp=45 freq=3][b]A[/b][/wave] key to [b]retreat backward[/b].","voice":"res://Assets/Music/Dialogues/How to Play/How to Play 4.mp3","key":"move_left"},
	#4
	{"text":"To [b]open the Wolf Almanac Menu[/b], press the [wave amp=45 freq=3][b]Q[/b][/wave] key.","voice":"res://Assets/Music/Dialogues/How to Play/How to Play 6.mp3","key":"open_wolf_almanac"},
	#5
	{"text":"To [b]toggle the mission log[/b], please press the [wave amp=45 freq=3][b]L [/b][/wave]key","voice":"res://Assets/Music/Dialogues/How to Play/To toggle the missio.wav","key":"mission_log"},
	#6
	{"text":"To [b]Shoot[/b], Press [wave amp=45 freq=3][b]Right Button[/b][/wave] On The Mouse","voice":"res://Assets/Music/Dialogues/How to Play/How To sHOOT.mp3","key":"shoot_brust_garou"},
	#7
	{"text":"To [b]reload Brust Garou Assault Riffle[/b], press the [wave amp=45 freq=3][b]R[/b][/wave] key.","voice":"res://Assets/Music/Dialogues/How to Play/Reloading.wav","key":"reloading"},
	#8
	{"text":"To [b]Slash[b], Press [wave amp=45 freq=3][b]Left Button[/b][/wave] On The Mouse","voice":"res://Assets/Music/Dialogues/How to Play/How to Slash.mp3","key":"slash_machete"},
	#9
	{"text":"With this knowledge bestowed upon you, may your quest be successful! Farewell, and good fortune in your endeavors.","voice":"res://Assets/Music/Dialogues/How to Play/How to Play 8.mp3","key":"interaction"},

]
var _current_step = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	player_singleton_autoload.ammo_bullets=30
	sfxalert.play()
	background.visible = false
	mrwolf.visible = false
	mrwolflabeldialog.visible = false
	dialogue_text.visible = false
	wordstilesets.visible = false
	redfox.visible = false
	player.visible = false
	playercoordinateandammo.hide()
	playerhealtandarmorbar.hide()
	playerinteractpane.hide()
	gui.visible = false
	mission_logs.visible = false
	wolfalmanacmenuindex.visible = false
	machete.visible = false
	brustgarouriffle.visible = false
	keyhintlbl.visible = false
	
		
func _input(event):
	if event.is_action_pressed(tutorial_steps[_current_step]["key"]):
		_current_step +=1
		show_step(_current_step)


func _on_confirmation_dialog_confirmed():
	dialogue_text.visible = true
	dialogue_text.text = "Yes. Well See ya"
	dialogueleave.play()
	await get_tree().create_timer(2.0).timeout
	_on_dialogue_leave_tutorial_finished()
	
func _on_sfx_alert_finished():
	dialogmenu.play()

func _on_confirmation_dialog_canceled():
	dialogue_text.visible = true
	dialogue_text.text = "No, Good Choose."
	dialogejoin.play()

func _on_dialogue_leave_tutorial_finished():
	queue_free()
	LoadingScreen.load_scence("res://Assets/Scences/UI/Mission_Brefing/mision_breffing.tscn")

func _on_dialogue_join_tutorial_finished():
	show_step(0)
				
func show_step(step_index:int):
	if step_index >= tutorial_steps.size():
		_change_scence()
		return
	var steps = tutorial_steps[step_index]
	match step_index:
		0:
			background.visible = true
			mrwolf.visible = true
			mrwolflabeldialog.visible = true
			keyhintlbl.visible = true
		1 : 
			wordstilesets.visible = true
			player.visible = true
			player.process_mode = 1
			playercoordinateandammo.visible = true
			playerhealtandarmorbar.visible = true
			gui.visible = true
		5 :
			mission_logs.visible = true
		6 :
			brustgarouriffle.visible = true	
			redfox.visible = true
			redfox.process_mode = 1
		8 :
			machete.visible = true
	dialogue_text.text = steps["text"]
	keyhintlbl.text = "[PRESS %s]" % steps["key"].to_upper()
	dialogenarator.stream = load(steps["voice"])
	dialogenarator.play()
	
func _change_scence():
	MissionStatData.reset_data()
	player_singleton_autoload.setter_brust_garou_equip(false)
	player_singleton_autoload.setter_machete_equip(false)
	player_singleton_autoload.setter_name("")
	player_singleton_autoload.setter_health(0)
	player_singleton_autoload.setter_armor(0)
	player_singleton_autoload.setter_location("")
	player_singleton_autoload.setter_ammo_bullet(0)
	player_singleton_autoload.setter_magazine_stock(0)
	queue_free()
	LoadingScreen.load_scence("res://Assets/Scences/UI/Mission_Brefing/mision_breffing.tscn")
	
