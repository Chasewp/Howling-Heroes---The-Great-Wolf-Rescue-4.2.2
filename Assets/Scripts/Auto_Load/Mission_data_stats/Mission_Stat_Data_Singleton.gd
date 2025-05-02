"""Singleton <AutoLoad> - Mision_Data_Stats"""
class_name Mision_Data_Stats_Singleton
extends Node

signal enemy_kill_updated(new_count)
signal wolf_rescue_updated(new_count)
signal boss_kill_updated(new_count)
signal reset(new_count1,new_count2,new_count3)

@export var wolf_rescued:int = 0
@export var enemy_kill:int = 0
@export var boss_kill : int = 0

@export var total_wolves_rescued : int:
	set= set_total_wolves_rescued
	
@export var total_boss_killed:int:
	set = set_total_boss_killed
	
@export var total_enemies_killed : int :
	set = set_total_enemies_killed


#for update_wolf_rescue_data from the wolf
func update_wolf_rescue():
	wolf_rescued +=1
	emit_signal("wolf_rescue_updated",wolf_rescued)
	
func update_enemy_kills():
	enemy_kill +=1
	emit_signal("enemy_kill_updated", enemy_kill)
	
func update_boss_kills():
	boss_kill+=1
	emit_signal("boss_kill_updated",boss_kill)
	
func set_total_wolves_rescued(total_wolves):
	total_wolves_rescued = total_wolves
	
func set_total_boss_killed(total_boss):
	total_boss_killed = total_boss
	
func set_total_enemies_killed(total_enemies):
	total_enemies_killed = total_enemies

func reset_data():
	wolf_rescued = 0
	enemy_kill = 0
	boss_kill = 0
	emit_signal("reset",wolf_rescued,enemy_kill,boss_kill)
