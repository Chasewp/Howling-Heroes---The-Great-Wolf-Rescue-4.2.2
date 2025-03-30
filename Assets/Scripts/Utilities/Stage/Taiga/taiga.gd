class_name Taiga_Biome
extends Level

@onready var music = $Music
@onready var platfrom = $platfrommAnimationPlayer
var teleported = teleport.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	music.play()
	platfrom.play("platfrom_move")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_teleport_stage_1_body_entered(body):
	if body.is_in_group("player"):
		if MissionStatData.enemy_kill == 5 and MissionStatData.boss_kill == 1 :
			body.set_position(teleported.destination.global_position)
		else:
			body.set_position(teleported.destination.global_position)
