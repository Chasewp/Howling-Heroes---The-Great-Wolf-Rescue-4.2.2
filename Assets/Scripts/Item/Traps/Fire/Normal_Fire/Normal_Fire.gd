class_name Fire_Traps
extends Core_Traps

func _on_area_entered(area):
	if area.is_in_group("player_hurtbox"):
		var player = area.get_parent()
		player.take_damage(damage, AP_Dmg, penetrate)
