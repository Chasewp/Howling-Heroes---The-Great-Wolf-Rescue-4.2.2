class_name Tundra_level
extends Level

var _boss_1 :bool
var _boss_2 :bool
var _boss_3 : bool
var _boss_4 : bool
var _boss_5 : bool
var _enemy : int


@onready var teleport1 = $Teleport/Teleport_A1
@onready var teleport2 = $Teleport/Teleport_A2
@onready var teleport3 
@onready var teleport4

@onready var bos_1_encounter 
@onready var bos_2_encounter 
@onready var bos_3_encounter 
@onready var bos_4_encounter 
@onready var bos_5_encounter 
@onready var player : Player_controlled

func _init():
	_enemy = MissionStatData.enemy_kill
	
func _ready():
	player_singleton_autoload.setter_location("Tundra")
	
func _on_bos_1_body_entered(body):
	if body.is_in_group("Player") and _enemy == 5:
		pass		
	
