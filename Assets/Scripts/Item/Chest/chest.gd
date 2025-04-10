class_name Chest
extends StaticBody2D

signal bos_executed

@export var is_bos_executed : bool = false
@onready var chest = $"."
@onready var chest_open = $ChestOpen
@onready var chest_closed = $ChestClosed
@onready var chest_open_sfx = $chest_open_sfx

func _ready():
		chest.visible = false
	
func _on_boss_executed(body):
	if body.is_in_group("player") and is_bos_executed == true:
		bos_executed.emit()
		chest.visible = true
		chest_open.visible = true
		chest_closed.visible = false
		chest_open_sfx.play()
		queue_free()
