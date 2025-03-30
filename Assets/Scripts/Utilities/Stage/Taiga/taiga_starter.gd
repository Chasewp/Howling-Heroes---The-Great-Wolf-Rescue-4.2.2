class_name Taiga_Starter
extends Level

@onready var music = $music


func _ready():
	super._ready()
	music.play()
	
