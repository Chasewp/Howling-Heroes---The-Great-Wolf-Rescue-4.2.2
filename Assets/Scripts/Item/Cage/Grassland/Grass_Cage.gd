class_name Grass_Cage
extends Cages

var _is_have_key : bool = player_singleton_autoload.is_have_grass_key

func _on_area_2d_body_entered(body):
	if body is Player_controlled and _is_have_key:
		sfx.play()	
		emit_signal("cage_unlocked") 
		_on_sfx_finished()
	else:
		access_denied.play()
