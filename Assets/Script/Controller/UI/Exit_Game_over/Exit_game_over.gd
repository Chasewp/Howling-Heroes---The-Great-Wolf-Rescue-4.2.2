extends Control

@onready var Bye = $Bye

func _ready():
	Bye.play()

#Qoutes
func _on_bye_finished():
	get_tree().quit()
