class_name Ground_Key
extends Area2D
@onready var animation_player = $AnimationPlayer
@export var float_height : float = 10.0
@export var float_speed : float = 2.0

var time_passed := 0.0
var can_pickup := false

func _ready():
	animation_player.play("float")  # Animasi mengambang
	# Tunggu sebentar sebelum bisa diambil
	await get_tree().create_timer(0.5).timeout
	can_pickup = true

func _on_body_entered(body):
	if body.is_in_group("player") and can_pickup:
		collect_key(body)

func collect_key(player):
	animation_player.play("get_the_key")
	player_singleton_autoload.setter_ground_key(true)
	await animation_player.animation_finished
	queue_free()
