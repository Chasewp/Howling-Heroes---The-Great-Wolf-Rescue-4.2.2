"Auto_Load <Single_Ton> - Attack_Type_Traps"
class_name Attack_Type_Traps_Singleton
extends Node

@export var Attack_Type : String :
	set = setter_Attack_Type
	
@export var Armour_Piercing : bool:
	set = setter_Armour_Piercing
	
@export var Damages: float :
	set = setter_Damages
	
#Setter Attack Type
func setter_Attack_Type(value : String):
	Attack_Type = value
	
#Setter Armour_piercing
func setter_Armour_Piercing(value:bool):
	Armour_Piercing = value

#Setter Damage
func setter_Damages(value:float):
	Damages = value

