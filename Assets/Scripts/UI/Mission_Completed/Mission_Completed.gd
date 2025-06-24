extends Level

@onready var animation = $AnimationPlayer
@onready var howling_sfx = $Howling_Sfx
@onready var missioncompleted = $Mission_completed
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	animation.play("Fade_In")
	howling_sfx.play()
	await get_tree().create_timer(6).timeout
	
func _on_howling_sfx_finished():
	missioncompleted.play()

func _on_exit_reached():
	super._on_exit_reached()
	animation.play("Fade_Out")
	await get_tree().create_timer(3).timeout
