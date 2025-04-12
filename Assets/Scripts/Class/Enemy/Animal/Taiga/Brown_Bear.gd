class_name Brown_Bear
extends Enemy_Main_Class


func died():
	queue_free()
	MissionStatData.update_enemy_kills()

func _process(delta):
	move(1,speed)
	move_and_slide()
	update_state()
	update_animation(direction.x)
