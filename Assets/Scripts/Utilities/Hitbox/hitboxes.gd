class_name Hitboxes
extends Area2D


@export var damage : float : set= set_damage, get = get_damage
@export var is_armor_piercing : bool: set= set_AP, get = get_AP
@export var AP_dmg : float : set = set_AP_dmg, get = get_AP_dmg

func _ready():
	print(damage, " ", is_armor_piercing," ", AP_dmg)
	
func set_damage(dmg : float):
	damage = max(dmg,0.0)
	
func get_damage():
	return damage
	
func set_AP(ap : bool):
	is_armor_piercing = ap
	
func get_AP():
	return is_armor_piercing
	
func set_AP_dmg(ap_dmg:float):
	AP_dmg = clamp(ap_dmg,0.0,1.0)
	
func get_AP_dmg():
	return AP_dmg
