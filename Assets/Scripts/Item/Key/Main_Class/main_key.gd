class_name Main_Keys
extends Area2D

@export var Chest : StaticBody2D
@export var is_player_nearby: bool

func ready():
	if not Chest:
		return
		
