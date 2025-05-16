extends Control

@onready var character_name = $Character_Name
@onready var biome_location = $Biome_Location
@onready var machete_image = %Machete
@onready var machete_background = %Machete_background
@onready var machete_Label = %LabelMacchete
@onready var burst_garou_background =%"Burst-Garou_background"
@onready var burst_garou_image =%Brust_Garou
@onready var burst_garou_label = %Labelbusrstgarou
@onready var weapon_swicher = $Weapon_Switcher

var save = load("user://Save/Progress/Save_Progress.tres")

	
func _ready():
	player_singleton_autoload.Keys_updated.connect(_update_all_keys)
	# Update UI dari singleton (baik dari save atau default)
	_update_ui_from_singleton()
	# Load data dari file save
	var save_path = "user://Save/Progress/Save_Progress.tres"
	if ResourceLoader.exists(save_path):
		save = load(save_path)
		if save is Data_Progress:
			# Update singleton dari save file
			_update_singleton_from_save(save)
		else:
			print("Invalid save data format.")
	else:
		print("No save file found. Using default singleton values.")
	
	
	
func _update_singleton_from_save(save_data: Data_Progress):
	player_singleton_autoload.setter_name(save_data.player_name)
	player_singleton_autoload.setter_armor(save_data.player_armor)
	player_singleton_autoload.setter_health(save_data.player_health)
	player_singleton_autoload.setter_location(save_data.player_biome_location)
	player_singleton_autoload.setter_pine_key(save_data.is_have_pine_key)
	player_singleton_autoload.setter_ice_key(save_data.is_have_ice_key)
	player_singleton_autoload.setter_stone_key(save_data.is_have_stone_key)
	player_singleton_autoload.setter_snow_fang_key(save_data.is_have_snow_fang_key)
	player_singleton_autoload.setter_frozen_paw_securelock_key(save_data.is_have_frozen_paw_securelook_key)
	player_singleton_autoload.setter_grass_key(save_data.is_have_grass_key)
	player_singleton_autoload.setter_dessert_key(save_data.is_have_dessert_key)

func _update_ui_from_singleton():
	character_name.text = player_singleton_autoload.getter_name()
	biome_location.text = "Location: " + player_singleton_autoload.getter_location()

func _update_all_keys():
	#Update visibility keys
	$Keys/Pine_Keys.visible = player_singleton_autoload.getter_pine_key()
	$Keys/Ice_Key.visible = player_singleton_autoload.getter_ice_key()
	$Keys/Stone_Key.visible = player_singleton_autoload.getter_stone_key()
	$Keys/Snow_Fang_Key.visible = player_singleton_autoload.getter_snow_fang_key()
	$Keys/Frozen_Paw_SecureLock_Key.visible = player_singleton_autoload.getter_frozen_paw_securelock_key()
	$Keys/Grass_Key.visible = player_singleton_autoload.getter_grass_key()
	$Keys/Flower_Key.visible = player_singleton_autoload.getter_flower_key()
	$Keys/Ground_Key.visible = player_singleton_autoload.getter_ground_key()
	$Keys/Dessert_Key.visible = player_singleton_autoload.getter_dessert_key()
