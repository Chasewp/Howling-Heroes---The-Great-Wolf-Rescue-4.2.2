class_name teleport
extends Area2D

@export var destination:Marker2D 


func _on_teleport_body_entered(body):
	if body.is_in_group("player"):
		body.set_position(destination.global_position)
		
