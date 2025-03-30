extends Node

"Fire Sprites"
@onready var fire1 = $Fire as AnimatedSprite2D
@onready var fire2 = $Fire2 as AnimatedSprite2D 
@onready var fire3 = $Fire3 as AnimatedSprite2D 
@onready var fire4 = $Fire4 as AnimatedSprite2D 
@onready var fire5 = $Fire5 as AnimatedSprite2D 
@onready var fire6 = $Fire6 as AnimatedSprite2D 
@onready var fire7 = $Fire7 as AnimatedSprite2D 
@onready var fire8 = $Fire8 as AnimatedSprite2D 

"Rotation_point"
@onready var rotation1 = $Rotation/Marker2D as Marker2D
@onready var rotation2 = $Rotation/Marker2D2 as Marker2D
@onready var rotation3 = $Rotation/Marker2D3 as Marker2D
@onready var rotation4 = $Rotation/Marker2D4 as Marker2D
@onready var rotation5 = $Rotation/Marker2D5 as Marker2D
@onready var rotation6 = $Rotation/Marker2D6 as Marker2D
@onready var rotation7 = $Rotation/Marker2D7 as Marker2D
@onready var rotation8 = $Rotation/Marker2D8 as Marker2D
@onready var main_rotation = $Rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	main_rotation.rotation_degrees += 1
	fire1.global_position = rotation1.global_position
	fire2.global_position = rotation2.global_position
	fire3.global_position = rotation3.global_position
	fire4.global_position = rotation4.global_position
	fire5.global_position = rotation5.global_position
	fire6.global_position = rotation6.global_position
	fire7.global_position = rotation7.global_position
	fire8.global_position = rotation8.global_position
