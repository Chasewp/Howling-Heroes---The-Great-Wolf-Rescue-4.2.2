class_name Wolves_Character
extends CharacterBody2D

signal wolf_rescue

@export_category("Class_Variable")
@export var Choirs : AudioStreamPlayer2D
@export var Howling_SFX : AudioStreamPlayer2D
@export var book_alamanac : PackedScene
@export var Cagees : StaticBody2D
@export var is_player_nearby: bool
@export var Wolf_Name : String 
@export var Wolf_Animation : AnimatedSprite2D

func _ready():
	self.visible = false
	if Cagees:
		Cagees.connect("cage_unlocked",Callable(self,"_on_cage_unlocked"))

		
func _on_cage_unlocked():
	self.visible = true
	Wolf_Animation.play("iddle")
	

func _on_inside_the_wolf(body):
	if body.is_in_group("player"):
		is_player_nearby = true
		Wolf_Animation.play("Howl")
		print("Player around the " + Wolf_Name+ " Wolf")
		
func _on_outside_the_wolf(body)	:
	if body.is_in_group("player"):
		is_player_nearby = true
		Wolf_Animation.play("iddle")
		print("Player leave the " + Wolf_Name+ " Wolf")
		
func _on_howling_finished()	:
	Choirs.play()
