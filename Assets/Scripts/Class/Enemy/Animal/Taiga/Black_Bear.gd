class_name Black_Bear
extends Enemy_Main_Class


func _ready():
	super._ready()
	left_bounds = self.position + Vector2(-300,0)
	right_bounds = self.position + Vector2(300,0)
	
func died():
	queue_free()
	MissionStatData.update_enemy_kills()

func _process(delta):
	handle_movement(delta)
	handle_gravity(delta)
	change_direction()
	look_for_player()

func _on_timer_timeout():
	animate_state = state.IDDLE

func change_direction() -> void:
	if animate_state == state.IDDLE:
		if enemy_sprites.flip_h:
			# moving right
			if self.position.x <= right_bounds.x:
				direction = Vector2(1, 0)
			else:
				# flip to moving left
				enemy_sprites.flip_h = false
				enemy_raycast.target_position = Vector2(-300, 0)
		else:
			# moving left
			if self.position.x >= left_bounds.x:
				direction = Vector2(-1, 0)
			else:
				# flip to moving right
				enemy_sprites.flip_h = true
				enemy_raycast.target_position = Vector2(300, 0)
	else:
		# Chase state. Follow player
		direction = (target_player.position - self.position).normalized()
		direction = sign(direction)
		if direction.x == 1:
			# flip to moving right
			enemy_sprites.flip_h = true
			enemy_raycast.target_position = Vector2(300, 0)
		else:
			# flip moving to left
			enemy_sprites.flip_h = false
			enemy_raycast.target_position = Vector2(-300, 0)
