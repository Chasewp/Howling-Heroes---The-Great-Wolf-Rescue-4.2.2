"Auto_Load <Singleton> - Data Progress"
class_name Data_Progress
extends Resource

@export var player_position: Vector2
@export var level_path:String
@export var player_name : String
@export var player_health : float
@export var player_armor : float
@export var player_biome_location : String
@export var mission_wolf_rescued : int
@export var mission_boss_elimated : int
@export var mission_enemy_elimated : int
@export var ammmo : int
@export var mag : int 
@export var is_have_pine_key:bool
@export var is_have_ice_key:bool
@export var is_have_stone_key:bool
@export var is_have_snow_fang_key:bool
@export var is_have_frozen_paw_securelook_key:bool	
@export var is_have_grass_key:bool
@export var is_have_flower_key:bool
@export var is_have_ground_key:bool
@export var is_have_dessert_key:bool
@export var is_machete_equip:bool
@export var is_brust_garou_equip:bool
@export var saved_data:Array[SavedData]=[]

func UpdatePos(value : Vector2):
	player_position = value

func add_magazine():
	if mag <=150:
		mag += 30
