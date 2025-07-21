class_name mission_completed_desert
extends Level

@onready var animation = $AnimationPlayer
@onready var desert_sfx = $Desert_Sfx
@onready var missioncomplete = $Mission_Complete_Sound

var is_transitioning := false

@export_file("*.tscn") var end_scene_path : String = "res://Assets/Scences/UI/End_Mission/End_Mission.tscn"

func _ready():
	super._ready()
	animation.play("Fade_In")
	desert_sfx.play()

	await get_tree().create_timer(5).timeout

	if not is_transitioning:
		missioncomplete.play()

	await missioncomplete.finished  # pastikan audio selesai
	_transition_to_end()
	

func _transition_to_end():
	if is_transitioning:
		return
	is_transitioning = true

	animation.play("Fade_Out")
	await animation.animation_finished

	# Reset data if needed
	if MissionStatData:
		MissionStatData.reset_data()

	if player_singleton_autoload:
		player_singleton_autoload.reset_all_stats()

	# Save final data if needed
	var data = Data_Progress.new()
	data.player_name = player_singleton_autoload.getter_name()
	data.player_biome_location = "Desert"
	data.player_armor = player_singleton_autoload.getter_armor()
	data.player_health = player_singleton_autoload.getter_health()
	data.ammmo = player_singleton_autoload.getter_ammo_bullet()
	data.mag = player_singleton_autoload.getter_magazine_stock()
	data.is_machete_equip = player_singleton_autoload.getter_machete_equip()
	data.is_brust_garou_equip = player_singleton_autoload.getter_brust_garou_equip()
	data.mission_wolf_rescued = MissionStatData.wolf_rescued
	data.mission_boss_elimated = MissionStatData.boss_kill
	data.mission_enemy_elimated = MissionStatData.enemy_kill

	var save_path = "user://Save/Progress/Save_Progress_Final.tres"
	var save_dir = "user://Save/Progress/"
	if not DirAccess.open(save_dir):
		DirAccess.make_dir_recursive_absolute(save_dir)
	ResourceSaver.save(data, save_path)

	# Langsung ganti scene ke ending
	get_tree().change_scene_to_file(end_scene_path)
