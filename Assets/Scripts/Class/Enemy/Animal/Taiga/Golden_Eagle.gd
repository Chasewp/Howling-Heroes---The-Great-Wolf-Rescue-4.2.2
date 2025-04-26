class_name Golden_Eagle
extends Enemy_Main_Class

func _ready():
	is_flying = true
	super._ready() # panggil fungsi base

func _physics_process(delta):
	if not target_player:
		return
	handle_flying_movement(delta)
	update_state()
	update_animation(direction.x)
