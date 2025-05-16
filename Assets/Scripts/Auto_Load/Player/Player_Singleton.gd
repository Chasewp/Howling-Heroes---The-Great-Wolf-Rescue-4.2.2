"Auto_Load <Singleton> - Player"
class_name Player_Singleton
extends Node

signal Keys_updated
# Variables class
@export_category("Variable Class")
@export var name_character : String :
	set = setter_name,
	get = getter_name
	
@export var health : float : 
	set = setter_health,
	get = getter_health
	
@export var armor : float : 
	set = setter_armor,
	get = getter_armor

@export var location : String : 
	set = setter_location,
	get = getter_location
	
@export var ammo_bullets : int :
	set = setter_ammo_bullet,
	get = getter_ammo_bullet
	
@export var magazine_stock : int :
	set = setter_magazine_stock,
	get = getter_magazine_stock

@export var is_machete_equip : bool:
	set = setter_machete_equip,
	get = getter_machete_equip
	
@export var is_burst_garou_equip : bool:
	set = setter_brust_garou_equip,
	get = getter_brust_garou_equip
	
@export var is_have_pine_key:bool:
	set = setter_pine_key,
	get = getter_pine_key
	
@export var is_have_ice_key:bool:
	set = setter_ice_key,
	get = getter_ice_key
	
@export var is_have_stone_key:bool:
	set = setter_stone_key,
	get = getter_stone_key
	
@export var is_have_snow_fang_key:bool:
	set = setter_snow_fang_key,
	get = getter_snow_fang_key
	
@export var is_have_frozen_paw_securelook_key:bool:
	set = setter_frozen_paw_securelock_key,
	get = getter_frozen_paw_securelock_key
	
@export var is_have_grass_key:bool:
	set = setter_grass_key,
	get = getter_grass_key
	
@export var is_have_flower_key:bool:
	set = setter_flower_key,
	get = getter_flower_key
	
@export var is_have_ground_key:bool:
	set =  setter_ground_key,
	get = getter_ground_key
	
@export var is_have_dessert_key:bool:
	set = setter_dessert_key,
	get = getter_dessert_key
	
# Getter Name Character
func getter_name() -> String:
	return name_character
	
# Getter Health
func getter_health() -> float:
	return health
	
# Getter Location
func getter_location() -> String:
	return location
	
# Getter Armor
func getter_armor() -> float:
	return armor

# Getter Ammo
func getter_ammo_bullet() -> int:
	return ammo_bullets

# Getter Magazine
func getter_magazine_stock() -> int:
	return magazine_stock

# Getter Machete
func getter_machete_equip() -> bool:
	return is_machete_equip

# Getter Brust Garou
func getter_brust_garou_equip() -> bool:
	return is_burst_garou_equip

# Getter Pine_Key
func getter_pine_key() -> bool:
	return is_have_pine_key
	
# Getter Ice_Key
func getter_ice_key() -> bool:
	return is_have_ice_key

# Getter Stone_Key
func getter_stone_key() -> bool:
	return is_have_stone_key

# Getter Snow_Fang_Key
func getter_snow_fang_key() -> bool:
	return is_have_snow_fang_key
	
# Getter Frozen_Paw_Securelock_Key
func getter_frozen_paw_securelock_key() -> bool:
	return is_have_frozen_paw_securelook_key
	
# Getter Grass_Key
func getter_grass_key() -> bool:
	return is_have_grass_key
	
# Getter Flower Key
func getter_flower_key() -> bool:
	return is_have_flower_key

# Getter Ground Key
func getter_ground_key() -> bool:
	return is_have_ground_key

# Getter Dessert Key
func getter_dessert_key() -> bool:
	return is_have_dessert_key

#Setter Name Character
func setter_name(nm:String):
	name_character = nm
	
#Setter Health
func setter_health(hlt:float):
	health = hlt
	
#Setter Location
func setter_location(lct:String):
	location = lct
	
#Setter Armor
func setter_armor(arm:float):
	armor = arm

#Setter Ammo
func setter_ammo_bullet(ammo:int):
	ammo_bullets = ammo

#Setter Magazine
func setter_magazine_stock(mag:int):
	magazine_stock = mag

#Setter Machete
func setter_machete_equip(machete:bool):
	is_machete_equip = machete

#Setter Brust Garou
func setter_brust_garou_equip(brust_garou:bool):
	is_burst_garou_equip = brust_garou

#Setter Pine_Key
func setter_pine_key(value:bool):
	is_have_pine_key = value
	emit_signal("Keys_updated")
#Setter Ice_Key
func setter_ice_key(value:bool):
	is_have_ice_key = value
	emit_signal("Keys_updated")
#Setter Stone_Key
func setter_stone_key(value:bool):
	is_have_stone_key = value
	emit_signal("Keys_updated")
#Setter Snow_Fang_Key
func setter_snow_fang_key(value:bool):
	is_have_snow_fang_key = value
	emit_signal("Keys_updated")
#Setter Frozen_Paw_Securelock_Key
func setter_frozen_paw_securelock_key(value:bool):
	is_have_frozen_paw_securelook_key = value
	emit_signal("Keys_updated")
#Setter Grass_Key
func setter_grass_key(value:bool):
	is_have_grass_key = value
	emit_signal("Keys_updated")
#Setter Flower Key
func setter_flower_key(value:bool):
	is_have_flower_key = value
	emit_signal("Keys_updated")
#Setter Ground Key
func setter_ground_key(value:bool):
	is_have_ground_key = value
	emit_signal("Keys_updated")
#Setter Dessert Key
func setter_dessert_key(value:bool):
	is_have_dessert_key = value
	emit_signal("Keys_updated")
