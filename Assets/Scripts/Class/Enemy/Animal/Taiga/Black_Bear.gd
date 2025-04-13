class_name Black_Bear
extends Enemy_Main_Class


func died():
	queue_free()
	MissionStatData.update_enemy_kills()

func _process(delta):
	# seing in to the player
	look_at(target_player.position)
	
	move(1,speed)
	move_and_slide()
	update_state()
	update_animation(delta)
