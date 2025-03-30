class_name Bullet_Singleton
extends AttackTypePlayerAutoloadSingleton

@export var speed : int :
	set = setter_speed_bullet

func setter_speed_bullet(value:int):
	speed = value
