extends Control

# Called when the node enters the scene tree for the first time.
@onready var name_player = $Player_Name
@onready var infochar = $info_char
var number_text


func _ready():
	name_player.grab_focus()

func _process(_delta):
	number_text = str(name_player.get_text()).length()
	infochar.set_text(str(number_text) + " / 32")
	#Hide Cursor 
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_name_text_submitted(new_text):
	# Set data ke singleton
	player_singleton_autoload.setter_name(new_text)
	player_singleton_autoload.setter_location("Taiga")
	player_singleton_autoload.setter_armor(100.0)
	player_singleton_autoload.setter_health(100.0)
	player_singleton_autoload.setter_ammo_bullet(30)
	player_singleton_autoload.setter_magazine_stock(150)
	# save data into the file
	var data = Data_Progress.new()
	data.player_name = player_singleton_autoload.getter_name()
	data.player_biome_location = player_singleton_autoload.getter_location()
	data.player_armor = player_singleton_autoload.getter_armor()
	data.player_health = player_singleton_autoload.getter_health()
	data.ammmo = player_singleton_autoload.getter_ammo_bullet()
	data.mag = player_singleton_autoload.getter_magazine_stock()
	data.is_machete_equip = player_singleton_autoload.getter_machete_equip()
	data.is_brust_garou_equip = player_singleton_autoload.getter_brust_garou_equip()
	data.mission_wolf_rescued = MissionStatData.wolf_rescued
	data.mission_boss_elimated = MissionStatData.boss_kill
	data.mission_enemy_elimated = MissionStatData.enemy_kill
	
	# save to file
	var dir = DirAccess.open("user://Save/Progress/")
	if not dir:
		DirAccess.make_dir_recursive_absolute("user://Save/Progress/")
	ResourceSaver.save(data, "user://Save/Progress/Save_Progress.tres")
	
	# Move scene
	get_tree().change_scene_to_file("res://Assets/Scences/Stages/Worlds/world_stages.tscn")
	
