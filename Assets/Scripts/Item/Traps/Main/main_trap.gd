class_name Main_Traps
extends Node2D

@export var damage : float
@export var _is_have_AP_dmg : bool
@export var penetrate: float

func _on_get_traped(area):
	if area.is_in_group("player_hurtbox"):
		var player = area.get_parent()
		player.take_damage(player.damage,_is_have_AP_dmg, player.penetrate)

