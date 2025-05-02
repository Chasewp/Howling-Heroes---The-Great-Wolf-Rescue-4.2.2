extends Node

"Fire Sprites"
@onready var fire1 = $Fire as AnimatedSprite2D
@onready var fire3 = $Fire3 as AnimatedSprite2D 
@onready var fire5 = $Fire5 as AnimatedSprite2D 
@onready var fire7 = $Fire7 as AnimatedSprite2D 

"Rotation_point"
@onready var rotation1 = $Rotation/Marker2D as Marker2D
@onready var rotation3 = $Rotation/Marker2D3 as Marker2D
@onready var rotation5 = $Rotation/Marker2D5 as Marker2D
@onready var rotation7 = $Rotation/Marker2D7 as Marker2D
@onready var main_rotation = $Rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	main_rotation.rotation_degrees += 1
	fire1.global_position = rotation1.global_position
	fire3.global_position = rotation3.global_position
	fire5.global_position = rotation5.global_position
	fire7.global_position = rotation7.global_position
