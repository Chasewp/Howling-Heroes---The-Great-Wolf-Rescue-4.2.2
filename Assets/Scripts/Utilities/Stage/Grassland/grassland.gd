class_name Grassland 
extends Level

	#player_singleton_autoload.setter_location("Taiga")
	#player_singleton_autoload.setter_armor(100.0)
	#player_singleton_autoload.setter_health(100.0)
	#player_singleton_autoload.setter_ammo_bullet(30)
	#player_singleton_autoload.setter_magazine_stock(150)
	## save data into the file
	#var data = Data_Progress.new()
	#data.player_name = player_singleton_autoload.getter_name()
	#data.player_biome_location = player_singleton_autoload.getter_location()
	#data.player_armor = player_singleton_autoload.getter_armor()
	#data.player_health = player_singleton_autoload.getter_health()
	#data.ammmo = player_singleton_autoload.getter_ammo_bullet()
	#data.mag = player_singleton_autoload.getter_magazine_stock()
	#data.is_machete_equip = player_singleton_autoload.getter_machete_equip()
	#data.is_brust_garou_equip = player_singleton_autoload.getter_brust_garou_equip()
	#data.mission_wolf_rescued = MissionStatData.wolf_rescued
	#data.mission_boss_elimated = MissionStatData.boss_kill
	#data.mission_enemy_elimated = MissionStatData.enemy_kill
	#
	## save to file
	#var dir = DirAccess.open("user://Save/Progress/")
	#if not dir:
		#DirAccess.make_dir_recursive_absolute("user://Save/Progress/")
	#ResourceSaver.save(data, "user://Save/Progress/Save_Progress.tres")

