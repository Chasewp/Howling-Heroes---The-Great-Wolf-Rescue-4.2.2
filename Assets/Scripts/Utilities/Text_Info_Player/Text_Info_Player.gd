extends Control

@onready var coordinate_label = $Coordinate
@onready var bullets_caps_label = $Ammo_Label/Bullets_Caps
@onready var magazine_label = $Ammo_Label/Mag_lbl

func _on_player_update_coordinate(player_position):
	coordinate_label.text = "Coordinate : " +  str(player_position)

func _on_player_update_ammo(player_ammo,player_magazine):
	bullets_caps_label.text = str(player_ammo)
	magazine_label.text = str(player_magazine)
