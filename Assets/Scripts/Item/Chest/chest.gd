class_name Chest
extends StaticBody2D

@export var key_scene : PackedScene  # Assign scene key di inspector
@onready var animation_player = $AnimationPlayer
@onready var closed_sprite = $ChestClosed
@onready var open_sprite = $ChestOpen
var is_opened := false

func _ready():
	closed_sprite.visible = false
	open_sprite.visible = false
	# Chest awalnya tersembunyi

func boss_defeated():
	# Munculkan chest setelah boss mati
	closed_sprite.visible = true
	animation_player.play("appear")  # Animasi muncul
	
	# Tunggu animasi selesai sebelum bisa dibuka
	await animation_player.animation_finished
	set_collision_layer_value(1, true)  # Aktifkan collision

func _on_body_entered(body):
	if body.is_in_group("player") and not is_opened:
		open_chest()

func open_chest():
	is_opened = true
	animation_player.play("open")
	$ChestOpenSFX.play()
	
	await animation_player.animation_finished
	spawn_key()
	queue_free()

func spawn_key():
	var key = key_scene.instantiate()
	key.position = position + Vector2(0, -20)  # Posisi di atas chest
	get_parent().add_child(key)
