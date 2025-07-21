class_name mission_completed_taiga
extends Level  # Ini penting, biar bisa pakai next_level dari parent

@onready var animation = $AnimationPlayer
@onready var howling_sfx = $Howling_Sfx
@onready var missioncompleted = $Mission_completed

var is_transitioning := false

func _ready():
	super._ready()
	animation.play("Fade_In")
	howling_sfx.play()

	# Setelah waktu lewat, atau suara selesai → mainkan mission complete
	await get_tree().create_timer(6).timeout

	if not is_transitioning:
		missioncompleted.play()

	# Tunggu selesai, lalu pindah level
	await missioncompleted.animation_finished
	_transition_to_next()
	

func _transition_to_next():
	if is_transitioning:
		return
	is_transitioning = true

	animation.play("Fade_Out")
	await animation.animation_finished

	get_tree().call_group("level", "queue_free")

	var worldroot = get_tree().root.get_node("World_Stages/WorldRoot")
	if worldroot:
		worldroot.load_level_async(next_level)
		MissionStatData.reset_data()
		if player_singleton_autoload and MissionStatData:
			player_singleton_autoload.setter_location("Tundra")
			player_singleton_autoload.setter_armor(100.0)
			player_singleton_autoload.setter_health(100.0)
			player_singleton_autoload.setter_ammo_bullet(30)
			player_singleton_autoload.setter_magazine_stock(150)
		else:
			push_warning("Autoload not found: player_singleton_autoload or MissionStatData")
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
	else:
		push_error("WorldRoot not found")
