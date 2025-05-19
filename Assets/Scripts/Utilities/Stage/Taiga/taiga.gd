class_name Taiga_Biome
extends Level

@onready var music = $music
@onready var platfrom = $platfrommAnimationPlayer

# Bos 1 & Stage 1
@onready var required5enemyexecutedsound = $"Bos_Encounter/Bos_1/Ecounter_To_bos/Required 5 enemy executed"
@onready var teleport_to_bos_1_position = $Bos_Encounter/Bos_1/Ecounter_To_bos/destination
@onready var labelrequired5enemyexecuted = $"Bos_Encounter/Bos_1/Ecounter_To_bos/Panel 5 required enemy"
#
#Bos 1 Executed
@onready var teleport_to_wolf_cage = $Bos_Encounter/Bos_1/cave_teleporter_To_Wolf_Cage/Area2D/Marker2D
@onready var teleport_wolf_cage = $Bos_Encounter/Bos_1/cave_teleporter_To_Wolf_Cage

# Called when the node enters the scene tree for the first time.
func _ready():
	music.play()
	platfrom.play("platfrom_move")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_teleport_stage_1_to_stage_2_player_body_entered(body):
	if body.is_in_group("player"):
		if MissionStatData.enemy_kill >= 5 and MissionStatData.boss_kill >= 1:
			body.set_position($Teleport/TeleportStage_2/destination.global_position)
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
#func _on_bos1_executed_bos_exited(body):
	#if body.is_in_group("player"):
		#teleport_wolf_cage.DISABLE_MODE_REMOVE
		#teleport_wolf_cage.visible = false
