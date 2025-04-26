class_name enemy_hitboxes
extends Hitboxes

@export var attack_coolingdown : float
@export var can_attack:=true

func _ready():
	add_to_group("enemy_hitbox")
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if can_attack and body.has_method("take_damage"):
		body.take_damage(damage, is_armor_piercing, AP_dmg)
		start_cooldown()

func start_cooldown():
	can_attack = false
	await get_tree().create_timer(attack_coolingdown).timeout
	can_attack = true
