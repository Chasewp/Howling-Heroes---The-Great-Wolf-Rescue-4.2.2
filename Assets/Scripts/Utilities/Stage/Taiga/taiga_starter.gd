class_name Taiga_Starter
extends Level

@onready var music = $music


func _ready():
	super._ready()
	music.play()
	

func _on_teleport_next_stage_body_entered(body):
	if body.is_in_group("player"):
		_on_exit_reached()
		get_tree().create_timer(1)
		SaveLoadManager.register_world_root(get_parent() as WorldRoot)
		
