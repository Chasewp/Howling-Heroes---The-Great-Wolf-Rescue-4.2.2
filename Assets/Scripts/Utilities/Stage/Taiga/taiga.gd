class_name Taiga_Biome
extends Level

@onready var music = $music
@onready var platfrom = $platfrommAnimationPlayer

# Heading to Bos 1  & Stage 1
@onready var required5enemyexecutedsound = $"Bos_Encounter/Bos_1/Ecounter_To_bos/Required 5 enemy executed"
@onready var teleport_to_bos_1_position = $Bos_Encounter/Bos_1/Ecounter_To_bos/destination
@onready var labelrequired5enemyexecuted = $"Bos_Encounter/Bos_1/Ecounter_To_bos/Panel 5 required enemy"
@onready var teleport_to_stage_2_marker = $"Teleport/Stage 1/cave_teleporter_to_stage_2/Area2D/Marker2D"

#Bos 1 Executed
@onready var teleport_to_eurasian_wolf_cage_marker = $Bos_Encounter/Bos_1/cave_teleporter_To_Wolf_Cage/Area2D/Marker2D
@onready var teleport_eurasian_wolf_cage_cave = $Bos_Encounter/Bos_1/cave_teleporter_To_Wolf_Cage # Teleport to Wolf Cage 

#Heading to Bos 2 & Stage 2
@onready var required10enemyexecutedsound = $"Bos_Encounter/Bos_2/Ecounter_To_bos2/Required 10 enemy executed"
@onready var teleport_to_bos_2_position = $Bos_Encounter/Bos_2/Ecounter_To_bos2/destination
@onready var labelrequired10enemyexecuted = $"Bos_Encounter/Bos_2/Ecounter_To_bos2/Panel 10 required enemy"

#enemies stage 1
@onready var goldeneaglestg1 = $Enemy/Stage_1/Golden_Eagle
@onready var blackbearstg1 = $Enemy/Stage_1/Black_Bear
@onready var redfoxstg1 = $Enemy/Stage_1/Red_fox
@onready var wolvrinestg1 = $Enemy/Stage_1/Wolvine
@onready var brownbearstg1 = $Enemy/Stage_1/Brown_Bear

#Bos 2 Executed
var teleport_to_machenzie_river_wolf_cage_marker
var teleport_to_machenzie_river_wolf_cage_cave

#Heading to Bos 3 & Stage 3
var required15enemyexecutedsound
var teleport_to_bos_3_position
var labelrequired15enemyexecuted

#Bos 3 Executed
var teleport_to_northern_rocky_mountain_wolf_marker
var teleport_to_northern_rocky_mountain_wolf_cave

#Heading Bos 4 & Stage 4
var required20enemyexecutedsound
var teleport_to_bos_4_position
var labelrequired20enemyexecuted

#Bos 4 Executed
var teleport_to_northwestern_wolf_marker
var teleport_to_northwestern_wolf_cave

#Heading to Bos 5 & Stage 5
var required30enemyexecutedsound
var teleport_to_bos_5_position
var labelrequired30enemyexecuted

#Bos 5 Executed
var teleport_british_columbian_wolf_marker
var teleport_british_columbian_wolf_cave

#Heading to Boss 6  & Stage 6
var required35enemyexecutedsound
var teleport_to_bos_6_position
var labelrequired35enemyexecuted

#Bos 6  Executed
var teleport_vancover_coastal_island_wolf_marker
var teleport_vancover_coastal_island_wolf_cave

#Heading to Bos 7 & Stage 7
var required40enemyexecutedsound
var teleport_to_bos_7_position
var labelrequired40enemyexecuted

#Bos 7 Executed
var teleport_alexander_archipelago_wolf_marker
var teleport_alexander_archipelago_wolf_cave

#Heading to Boss 8 & Stage 8
var required45enemyexecutedsound
var teleport_to_bos_8_position
var labelrequired45enemyexecuted

#Bos 8 Executed
var teleported_labrador_wolf_marker
var teleported_labrador_wolf_cave

#Heading to Boss 9 & Stage 9
var required50enemyexecutedsound
var teleport_to_bos_9_position
var labelrequired50enemyexecuted

#Boss 9 Executed
var teleported_interior_alaskan_wolf_marker
var teleported_interior_alaskan_wolf_cave

#Heading to Boss 10 & Stage 10
var required70enemyexecutedsound
var teleport_to_bos_10_position
var labelrequired70enemyexecuted

#Boss 10 Executed
var teleported_hudson_bay_wolf_marker
var teleported_hudson_bay_wolf_cave

# Called when the node enters the scene tree for the first time.
func _ready():
	goldeneaglestg1.position=Vector2(1851,219)
	music.play()
	platfrom.play("platfrom_move")
	

	
	#match MissionStatData.boss_kill:
		#1:
			#teleport_eurasian_wolf_cage_cave.visible = true
		#2:
			#teleport_to_machenzie_river_wolf_cage_cave.visible = true
		#3:
			#teleport_to_northern_rocky_mountain_wolf_cave.visible = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_teleport_stage_1_to_stage_2_player_body_entered(body):
	if body.is_in_group("player"):
		if MissionStatData.enemy_kill >= 5 and MissionStatData.boss_kill >= 1:
			body.set_position(teleport_to_stage_2_marker.global_position)
		else:
			$Teleport/TeleportStage_2/Sfx_deniied.play()

#func _on_teleport_stage_2_to_stage_3_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill >= 10 and MissionStatData.boss_kill >= 2 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_3_to_stage_4_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 15 and MissionStatData.boss_kill == 3 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_4_to_stage_5_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 20 and MissionStatData.boss_kill == 4 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_5_to_stage_6_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 30 and MissionStatData.boss_kill ==5 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_6_to_stage_7_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 35 and MissionStatData.boss_kill == 6 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_7_to_stage_8_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 40 and MissionStatData.boss_kill == 7 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_8_to_stage_9_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 45 and MissionStatData.boss_kill == 8 :
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)
#
#func _on_teleport_stage_9_to_stage_10_player_body_enter(body):
	#if body.is_in_group("player"):
		#if MissionStatData.enemy_kill == 50 and MissionStatData.boss_kill == 9:
			#body.set_position(teleported.destination.global_position)
		#else:
			#body.set_position(teleported.destination.global_position)

#Teleport to Bos 1 Stage
func _on_teleport_stage_body_entered(body):
	if body.is_in_group("player") and MissionStatData.enemy_kill >= 5:
		labelrequired5enemyexecuted.visible = false
		body.set_position(teleport_to_bos_1_position.global_position)
		
	else:
		labelrequired5enemyexecuted.visible = true
		required5enemyexecutedsound.play()

func _on_teleport_stage_body_exited(body):
	if body.is_in_group("player"):
		labelrequired5enemyexecuted.visible = false
		required5enemyexecutedsound.stop()

#func _on_boss1_executed_body_enter(body):
	#if body.is_in_group("player"):
		#body.set_position(teleport_to_wolf_cage.global_position)
		#
#

func _on_get_eurasian_wolf(body):
	if body.is_in_group("player") and MissionStatData.boss_kill== 1:
		body.set_position(teleport_to_eurasian_wolf_cage_marker.global_position)
		

func _on_heal_arena_body_entered(body):
	if body.is_in_group("player"):
		if player_singleton_autoload.health and player_singleton_autoload.armor<=100:
			player_singleton_autoload.health += 100
			player_singleton_autoload.armor +=100
		else:
			player_singleton_autoload.health = player_singleton_autoload.health
			player_singleton_autoload.armor = player_singleton_autoload.armor


func _on_teleport_next_stage_body_entered(body):
	if body.is_in_group("player"):
		# Emit the exit signal through the proper channel
		exit_reached.emit(next_level)
		
		# Optional: Add transition delay
		await get_tree().create_timer(1.0).timeout
