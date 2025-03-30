class_name Hurtboxes
extends Area2D

signal received_damage(damage: float, is_AP: bool, AP_dmg: float)
signal executed
@export var Healths: float 
@export var Armors: float 
@export var Eficient_Armors: float  

func _ready():
	connect("area_entered", _on_take_damage)

func _on_take_damage(hitbox: Hitboxes) -> void:
	if hitbox != null:
		var damage = hitbox.damage
		
		if hitbox.is_armor_piercing:
			# AP damage kena Armor & Health sekaligus
			var armor_damage = (damage * hitbox.AP_dmg) * Eficient_Armors  # Damage ke Armor
			var health_damage = damage * (1.0 - hitbox.AP_dmg)  # Damage langsung ke Health

			# Kalau Armor masih ada, serap damage dulu
			if Armors > 0:
				if Armors >= armor_damage:
					Armors -= armor_damage
				else:
					# Armor habis → sisa damage ke Health
					var leftover_damage = armor_damage - Armors
					Armors = 0
					health_damage += leftover_damage  # Tambahin ke health_damage yang udah ada

			# Kurangi Health dengan total damage yang lolos
			Healths -= health_damage
		
		else:
			# Non-AP damage langsung kena Health
			Healths -= damage
		if Healths <=0:
			executed.emit()
		
		# Emit sinyal damage
		received_damage.emit(damage, hitbox.is_armor_piercing, hitbox.AP_dmg)
		
	print("Health:", Healths,"|", "Armor:", Armors,"|", "Efisiensi Armor:", Eficient_Armors)
