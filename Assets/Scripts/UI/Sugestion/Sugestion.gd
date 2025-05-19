extends Control

@onready var sfx = $AudioStreamPlayer2D
@onready var fade_animation = $AnimationPlayer


func _ready():
	fade_animation.play("Fade_in")
	sfx.play()


func _on_audio_stream_player_2d_finished():
	fade_animation.play("Fade_out")
	get_tree().change_scene_to_file("res://Assets/Scences/UI/Tutorial/tutorial.tscn")
