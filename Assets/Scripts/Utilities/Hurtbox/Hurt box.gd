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
	
	var hitboxess = self.get_overlapping_areas()
	for hitboxs in hitboxess:
		if hitboxs != null and hitboxs is Hitboxes:
			var damage = hitboxs.damage
			var is_ap = hitboxs.is_armor_piercing
			var ap_dmg = hitboxs.AP_dmg
			
			if is_ap:
				var armor_damage = damage * ap_dmg * Eficient_Armors
				var health_damage = damage * (1.0 - ap_dmg)
				
				if Armors > 0:
					if Armors >= armor_damage:
						Armors -= armor_damage
					else:
						# Jika armor habis, sisa damage ke health
						health_damage += (armor_damage - Armors)
						Armors = 0
				
				# PASTIKAN DAMAGE KE HEALTH
				Healths -= health_damage  # <-- BARIS INI HARUS ADA
			else:
				# Non-AP: Langsung ke health
				Healths -= damage
			
			# Panggil died() jika health <= 0
			if Healths < 0:
				executed.emit()
			
			received_damage.emit(damage, is_ap, ap_dmg)
		print("======== DAMAGE REPORT ========")
		print("Health : ", Healths)	
		print("Armor: ",Armors)
		print("Eficient Armor: ",Eficient_Armors)
		print("Damages : ", hitboxs.damage)
		print("AP_Damages : ", hitboxs.AP_dmg)
