class_name ArrowTrapBase
extends StaticBody2D

@export var arrow_scene : PackedScene
@export var shoot_interval := 2.0
@export var triple_shot := false
@export var is_homing := false
@export var is_destructible := true
@export var health := 30.0

@onready var shoot_timer = $ShootTimer
@onready var shoot_point = $ShootPoint

func _ready():
	shoot_timer.wait_time = shoot_interval
	shoot_timer.start()

func shoot():
	var directions = []
	if triple_shot:
		directions = [Vector2.RIGHT, Vector2.RIGHT.rotated(0.2), Vector2.RIGHT.rotated(-0.2)]
	else:
		directions = [Vector2.RIGHT]
	
	for dir in directions:
		var arrow = arrow_scene.instantiate()
		arrow.setup(dir.rotated(rotation), get_tree().get_first_node_in_group("player") if is_homing else null)
		arrow.position = shoot_point.global_position
		arrow.rotation = dir.angle() + rotation
		get_parent().add_child(arrow)
	
	$AnimationPlayer.play("shoot")

func take_damage(amount: float):
	if !is_destructible:
		return
	
	health -= amount
	$HitAnimation.play("hit")
	
	if health <= 0:
		queue_free()

func _on_shoot_timer_timeout():
	shoot()
