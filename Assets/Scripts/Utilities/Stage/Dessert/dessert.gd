class_name Desert_Biome
extends Level

"Boss_1"
@onready var boss1_barrier_collision =$"Walls/Boss_Barrier/Wall_Barrier_Bos 1/wall_bos_1-opening/wall_bos_1_- opening_Collision"
@onready var boss1_barrier = $"Walls/Boss_Barrier/Wall_Barrier_Bos 1/wall_bos_1-opening"
@onready var bos1_player_spawn = $Bos_enccounter/bos_1/Destinaton_bos1

"Boss_2"
@onready var boss2_barrier_collision = $"Walls/Boss_Barrier/Wall_Barrier_Bos_2/wall_bos_2-opening/wall_bos_2_- opening_Collision"
@onready var boss2_barrier = $"Walls/Boss_Barrier/Wall_Barrier_Bos_2/wall_bos_2-opening/wall_bos_2_- opening_Collision"
@onready var boss2_player_spawn = $Bos_enccounter/bos_2/Destinaton_bos2

"Boss_3"
@onready var boss3_barrier_collision
@onready var boss3_barrier
@onready var boss3_player_spaawn

"Boss_4"
@onready var boss4_barrier_collision
@onready var boss4_barrier
@onready var boss4_player_spawn 

"Dead_Zone"
# Zone 1 
@onready var spawner_dead_zone_1 = $"Dead_zone/Dead_zone 1/Dead_Zone_1_Respawn"
# zone 2
@onready var spawner_dead_zone_2 = $Dead_zone/Dead_zone_2/Marker2D
"Teleport"
@onready var teleport1 = $"Dead_zone/Dead_zone 1"

#music
@onready var wind_sfx = $sfx_wind
@onready var background_music = $backsound_music

var _boss_1_executed : bool
var _boss_2_executed : bool 
var _boss_3_executed : bool
var _boss_4_executed : bool
var _enemy : int

func _init():
	_enemy = MissionStatData.enemy_kill
# Called when the node enters the scene tree for the first time.
func _ready():
	wind_sfx.play()
	background_music.play()
	player_singleton_autoload.setter_location("Dessert")
	
func _on_bos_1_body_entered(body):
	if body.is_in_group("player") and _enemy == 10:
		body.set_position(bos1_player_spawn.global_position)

func _on_dead_zone_1_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(5,true,0.5)
		body.set_position(spawner_dead_zone_1.global_position)
	
func _on_dead_zone_2_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(5,true,0.5)
		body.set_position(spawner_dead_zone_2.global_position)


func _on_bos_2_body_exited(body):
	pass # Replace with function body.



