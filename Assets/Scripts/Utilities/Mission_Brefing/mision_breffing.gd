extends Node2D

func _ready():
	start_dialog()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("Intro_Player")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	

func _on_dialogic_signal(argument:String):
	match argument:
		"Change_Scence":
			LoadingScreen.load_scence("res://Assets/Scences/UI/Character_Name/Player_Name.tscn")
		"Deactive_cursor":
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
