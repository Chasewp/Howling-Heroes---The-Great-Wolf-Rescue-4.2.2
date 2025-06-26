extends Level

@onready var animation = $AnimationPlayer
@onready var howling_sfx = $Howling_Sfx
@onready var missioncompleted = $Mission_completed

var is_transitioning := false

func _ready():
	super._ready()
	animation.play("Fade_In")
	howling_sfx.play()
	await get_tree().create_timer(6).timeout

func _on_howling_sfx_finished():
	if not is_transitioning:  # Only play if not transitioning
		missioncompleted.play()

func _on_exit_reached(next:String):
	if is_transitioning:
		return  # Prevent multiple triggers
	
	is_transitioning = true
	
	# Stop all audio
	howling_sfx.stop()
	missioncompleted.stop()
	
	# Fade out
	animation.play("Fade_Out")
	await animation.animation_finished
	
	# Clean up any remaining processes
	get_tree().call_group("level", "queue_free")
	
	# Load next level
	exit_reached.emit(next)
