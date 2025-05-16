class_name Cages
extends Area2D

signal cage_unlocked

@export var sfx :AudioStreamPlayer2D
@export var access_denied :AudioStreamPlayer2D

func _on_out_side_cage(body):
	if body.is_in_group("player"):
		access_denied.stop()
		
func _on_sfx_finished():
	queue_free()
	
