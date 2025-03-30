class_name Tundra_Wolf
extends Wolves_Character

func _ready():
	Wolf_Name = WolfData._get_Tundra_Wolf_Name()
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(Wolf_Name)
	
func _process(delta):
	if is_player_nearby and Input.is_action_just_pressed("interaction"):
		rescue()
		
func rescue():
	emit_signal("wolf_rescue")
	Howling_SFX.play()
	print("The " + Wolf_Name + " have been rescued")
	show_alamanac()
	queue_free()

func show_alamanac():
	var almanac = book_alamanac.instantiate()
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Tundra_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Tundra_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Tundra_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Tundra_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Tundra_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Tundra_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Tundra_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Tundra_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Tundra_Wolf_Image_Path())
	# Set Wolf Rescued
	WolfData._set_Tundra_Wolf_Rescue_Status(true)
	_on_howling_finished()
	AlmanacOpenCloser.wolf_almanac_scene = almanac
	AlmanacOpenCloser.open_wolf_almanac()

