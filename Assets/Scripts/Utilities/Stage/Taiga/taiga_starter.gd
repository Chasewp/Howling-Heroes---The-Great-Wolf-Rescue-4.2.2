class_name Taiga_Starter
extends Level

@onready var music = $music


func _ready():
	super._ready()
	music.play()
	next_level = "res://Assets/Scences/Stages/Taiga/taiga_a_3.tscn"
