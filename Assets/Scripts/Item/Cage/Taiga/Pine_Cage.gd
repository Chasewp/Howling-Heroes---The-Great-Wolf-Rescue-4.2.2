class_name PineCage
extends Cages

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and player_singleton_autoload.is_have_pine_key == true:
		sfx.play()	
		emit_signal("cage_unlocked") 
		_on_sfx_finished()
		queue_free()
	else:
		access_denied.play()
