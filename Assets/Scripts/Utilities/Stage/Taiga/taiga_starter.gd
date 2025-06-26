class_name Taiga_Starter
extends Level

@onready var music = $music
@onready var teleport_area = $TeleportNextStage  # Make sure this matches your area node name

func _ready():
	super._ready()
	music.play()
	
	# Connect the teleport area if it exists
	if teleport_area:
		teleport_area.body_entered.connect(_on_teleport_next_stage_body_entered)
	else:
		push_warning("Teleport area not found!")

func _on_teleport_next_stage_body_entered(body):
	if body.is_in_group("player"):
		# Emit the exit signal through the proper channel
		exit_reached.emit(next_level)
		
		# Optional: Add transition delay
		await get_tree().create_timer(1.0).timeout
		
		# Save game
		if SaveLoadManager:
			SaveLoadManager.register_world_root(get_parent() as WorldRoot)
