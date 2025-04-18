class_name Brown_Bear
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
	if not is_instance_valid(target_player):
		return  # Skip if player is missing
	# Pastikan semua node masih valid
	if not is_instance_valid(enemy_sprites) or not is_instance_valid(enemy_raycast):
		return
	
	if animate_state == state.IDDLE:
		if enemy_sprites.flip_h:
			if self.position.x <= right_bounds.x:
				direction = Vector2(1, 0)
			else:
				enemy_sprites.flip_h = false
				if is_instance_valid(enemy_raycast):
					enemy_raycast.target_position = Vector2(-300, 0)
		else:
			if self.position.x >= left_bounds.x:
				direction = Vector2(-1, 0)
			else:
				enemy_sprites.flip_h = true
				if is_instance_valid(enemy_raycast):
					enemy_raycast.target_position = Vector2(300, 0)
	else:
		if not is_instance_valid(target_player):
			animate_state = state.IDDLE
			return
			
		direction = (target_player.global_position - self.global_position).normalized()
		direction = sign(direction)
		if direction.x == 1:
			enemy_sprites.flip_h = true
			if is_instance_valid(enemy_raycast):
				enemy_raycast.target_position = Vector2(300, 0)
		else:
			enemy_sprites.flip_h = false
			if is_instance_valid(enemy_raycast):
				enemy_raycast.target_position = Vector2(-300, 0)
