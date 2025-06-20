extends Node
class_name SaveLoadManagerFile

var play:Player_controlled 
var stage_root : WorldRoot 

func register_world_root(root: WorldRoot):
	stage_root = root

func register_player(player: Player_controlled):
	play = player
	
func _ready():
	#Find dymanic player & stage_root
	play = get_tree().root.find_child("Player", true, false) as Player_controlled
	stage_root = get_tree().root.find_child("WorldRoot", true, false) as WorldRoot
	
	if not play or not stage_root:
		push_error("Failed to find required nodes for SaveLoadManager")
		return

	new_game()
	
# Function to save game data
func save_game():
	if not is_instance_valid(stage_root):
		push_error("WorldRoot is not valid, cannot save game")
		return
		
	var save_progress: Data_Progress = Data_Progress.new()
	
		# save the path to the currently loaded level
	save_progress.level_path = get_current_level_path_safe()
	
	#store player health, position, biome_location, & equipments
	save_progress.player_position = play.global_position
	save_progress.player_name = player_singleton_autoload.name_character
	save_progress.player_biome_location = player_singleton_autoload.location
	save_progress.player_health = player_singleton_autoload.health
	save_progress.player_armor = player_singleton_autoload.armor
	save_progress.ammmo = player_singleton_autoload.ammo_bullets
	save_progress.mag = player_singleton_autoload.magazine_stock
	save_progress.is_brust_garou_equip = player_singleton_autoload.is_burst_garou_equip
	save_progress.is_machete_equip = player_singleton_autoload.is_machete_equip
	
	#store mission log
	save_progress.mission_wolf_rescued = MissionStatData.wolf_rescued
	save_progress.mission_boss_elimated = MissionStatData.boss_kill
	save_progress.mission_enemy_elimated = MissionStatData.enemy_kill
	
	#Store Keys
	"Taiga Keys"
	save_progress.is_have_pine_key = player_singleton_autoload.is_have_pine_key
	save_progress.is_have_ice_key = player_singleton_autoload.is_have_ice_key
	save_progress.is_have_stone_key = player_singleton_autoload.is_have_stone_key
	
	"Tundra Keys"
	save_progress.is_have_snow_fang_key = player_singleton_autoload.is_have_snow_fang_key
	save_progress.is_have_frozen_paw_securelook_key = player_singleton_autoload.is_have_frozen_paw_securelook_key
	
	"Grassland Keys"
	save_progress.is_have_grass_key = player_singleton_autoload.is_have_grass_key
	save_progress.is_have_flower_key = player_singleton_autoload.is_have_flower_key
	save_progress.is_have_ground_key = player_singleton_autoload.is_have_ground_key
	
	"Dessert Key"
	save_progress.is_have_dessert_key = player_singleton_autoload.is_have_dessert_key

	
	# collect all dynamic game elements	
	var saved_data:Array[SavedData] = []
	get_tree().call_group("game_events", "on_save_game", saved_data)
	
	# store them in the savegame
	save_progress.saved_data = saved_data
	
	# write the savegame to disk
	ResourceSaver.save(save_progress, "user://Save/Progress/Save_Progress.tres")
	print("Game saved successfully.")

func get_current_level_path_safe() -> String:
	if not is_instance_valid(stage_root):
		return ""
	
	# Coba beberapa cara untuk mendapatkan path level
	if stage_root.has_method("get_current_level_path"):
		return stage_root.get_current_level_path()
	
	# Alternatif: cari level secara manual
	for node in get_tree().get_nodes_in_group("level"):
		if node.scene_file_path:
			return node.scene_file_path
	
	return "res://invalid.tscn"
	
func save_check_points(pos:Vector2,_stg : String):
	var save_progress: Data_Progress = Data_Progress.new()
	
	#Store checkpoint and stages
	save_progress.player_position = pos
	#get_path_scences
	save_progress.saved_data = []
	for item in get_tree().get_nodes_in_group("game_events"):
		var saved_item = SavedData.new()
		saved_item.Scence_path=item.get_scene_path()
		
	
	#store player health,biome_location, armor
	save_progress.player_name = player_singleton_autoload.name_character
	save_progress.player_biome_location = player_singleton_autoload.location
	save_progress.player_health = player_singleton_autoload.health
	save_progress.player_armor = player_singleton_autoload.armor

	#store mission log
	save_progress.mission_wolf_rescued = MissionStatData.wolf_rescued
	save_progress.mission_boss_elimated = MissionStatData.boss_kill
	save_progress.mission_enemy_elimated = MissionStatData.enemy_kill
	
	#Store Keys
	"Taiga Keys"
	save_progress.is_have_pine_key = player_singleton_autoload.is_have_pine_key
	save_progress.is_have_ice_key = player_singleton_autoload.is_have_ice_key
	save_progress.is_have_stone_key = player_singleton_autoload.is_have_stone_key
	
	"Tundra Keys"
	save_progress.is_have_snow_fang_key = player_singleton_autoload.is_have_snow_fang_key
	save_progress.is_have_frozen_paw_securelook_key = player_singleton_autoload.is_have_frozen_paw_securelook_key
	
	"Grassland Keys"
	save_progress.is_have_grass_key = player_singleton_autoload.is_have_grass_key
	save_progress.is_have_flower_key = player_singleton_autoload.is_have_flower_key
	save_progress.is_have_ground_key = player_singleton_autoload.is_have_ground_key
	
	"Dessert Key"
	save_progress.is_have_dessert_key = player_singleton_autoload.is_have_dessert_key
	
# write the savegame to disk
	ResourceSaver.save(save_progress, "user://Save/Progress/Save_Progress.tres")
	print("Game saved successfully.")
	
# Function to load game data
func load_game():
	# fix any paths that may be broken after a game update
	var fixing_path = Path_Fixer.fix_paths("user://Save/Progress/Save_Progress.tres")
	print("Loading from ", fixing_path)
	
	# load the savegame securely
	var save_progress:Data_Progress = SafeResourceLoader.load(fixing_path) as Data_Progress
	if save_progress == null:
		return
	
	# first restore the level
	# this may take a few frames, so we wait with await
	await stage_root.load_level_async(save_progress.level_path)
	
	# clear the stage
	get_tree().call_group("game_events", "on_before_load_game")
	
	# restore player position
	play.global_position = save_progress.player_position
	# restore player name
	player_singleton_autoload.name_character = save_progress.player_name 
	#restore player biome location
	player_singleton_autoload.location = save_progress.player_biome_location
	
	# verify & restore player health
	player_singleton_autoload.health = min(save_progress.player_health, 100)
	# verify & restore player armor
	player_singleton_autoload.armor = min(save_progress.player_armor,100)
	# verify & restore player ammo
	player_singleton_autoload.ammo_bullets = min(save_progress.ammmo,75)
	# verify & restore player Mag
	player_singleton_autoload.magazine_stock = min(save_progress.mag,750)
	
	#Restore Keys
	"Taiga Keys"
	player_singleton_autoload.is_have_pine_key = save_progress.is_have_pine_key 
	player_singleton_autoload.is_have_ice_key = save_progress.is_have_ice_key 
	player_singleton_autoload.is_have_stone_key = save_progress.is_have_stone_key  
	
	"Tundra Keys"
	player_singleton_autoload.is_have_snow_fang_key = save_progress.is_have_snow_fang_key
	player_singleton_autoload.is_have_frozen_paw_securelook_key = save_progress.is_have_frozen_paw_securelook_key
	
	"Grassland Keys"
	player_singleton_autoload.is_have_grass_key = save_progress.is_have_grass_key
	player_singleton_autoload.is_have_flower_key = save_progress.is_have_flower_key
	player_singleton_autoload.is_have_ground_key = save_progress.is_have_ground_key
	
	"Dessert Key"
	player_singleton_autoload.is_have_dessert_key = save_progress.is_have_dessert_key
	
	# restore equipments
	player_singleton_autoload.is_burst_garou_equip = save_progress.is_brust_garou_equip 
	player_singleton_autoload.is_machete_equip = save_progress.is_machete_equip 
	
	# restore all dynamic game elements	
	for item in save_progress.saved_data:
		# skip over data we don't use anymore
		if item is UnusedData:
			continue
		
		# load the scene of the saved item and create a new instance
		var scene := load(item.scene_path) as PackedScene
		var restored_node = scene.instantiate()
		# add it to the world root
		stage_root.add_child(restored_node)
		# and run any custom load logic
		if restored_node.has_method("on_load_game"):
			restored_node.on_load_game(item)
	
	
func save_file_exist()->bool:
	return ResourceLoader.exists("user://Save/Progress/Save_Progress.tres")
	
func new_game():
	var _save_progress: Data_Progress = Data_Progress.new()
