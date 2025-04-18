"""Singleton <AutoLoad> - Mision_Data_Stats"""
class_name Mision_Data_Stats_Singleton
extends Node

@export var _mission_UI_lbl_wolf_rescued : Label
@export var _mission_UI_lbl_enemy_killed : Label
@export var _mission_UI_lbl_boss_killed : Label

@export var wolf_rescued:int = 0
@export var enemy_kill:int = 0
@export var boss_kill : int = 0

@export var total_wolves_rescued : int:
	set= set_total_wolves_rescued
	
@export var total_boss_killed:int:
	set = set_total_boss_killed
	
@export var total_enemies_killed : int :
	set = set_total_enemies_killed

func _ready():
	_mission_UI_lbl_wolf_rescued = get_tree().root.get_node("World_Stages/UI/Mission/VBoxContainer/Mission_1_Task/LBL_WR")
	_mission_UI_lbl_enemy_killed = get_tree().root.get_node("World_Stages/UI/Mission/VBoxContainer/Mission_2_Task/LBL_EE")
	_mission_UI_lbl_boss_killed= get_tree().root.get_node("World_Stages/UI/Mission/VBoxContainer/Mission 3_Task/LBL_BE")

#for update_wolf_rescue_data from the wolf
func update_wolf_rescue():
	wolf_rescued +=1
	_mission_UI_lbl_wolf_rescued.text = str(wolf_rescued)
	
func update_enemy_kills():
	enemy_kill +=1
	_mission_UI_lbl_enemy_killed.text = str(enemy_kill)
	
func update_boss_kills():
	boss_kill+=1
	_mission_UI_lbl_boss_killed.text = str(boss_kill)
	
func set_total_wolves_rescued(total_wolves):
	total_wolves_rescued = total_wolves
	
func set_total_boss_killed(total_boss):
	total_boss_killed = total_boss
	
func set_total_enemies_killed(total_enemies):
	total_enemies_killed = total_enemies
