extends Node2D

func _ready():
	start_dialog()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("Finish-Mission")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	

func _on_dialogic_signal(argument:String):
	match argument:
		"quit_game":
			LoadingScreen.load_scence("res://Assets/Scences/UI/Exit_Game_Over/Exit_Game_Over.tscn")
		"Deactive_cursor":
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
