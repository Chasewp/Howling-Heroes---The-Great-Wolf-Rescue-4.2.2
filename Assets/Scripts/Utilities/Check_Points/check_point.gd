extends Area2D

@onready var sfx = $SFX
@onready var animation = $Check_points_Spirites/AnimationPlayer
@onready var player_spawner = $Marker2D

var _check_point_manager :Node
var save_manager:SaveLoadManagerFile 

func _ready():
	animation.play("Iddle")
	_check_point_manager = get_parent().get_parent().get_node("CheckpointManager")
	save_manager = get_tree().get_first_node_in_group("Save_loader")
	
	if _check_point_manager == null:
		print("CheckpointManager not found!")
	if save_manager == null:
		print("SaveLoadManagerFile not found!")
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		_check_point_manager.last_location = player_spawner.global_position
		save_manager.save()
		sfx.play()	
		
func _on_sfx_finished():
		animation.play("default")
