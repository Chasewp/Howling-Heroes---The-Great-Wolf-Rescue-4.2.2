class_name Eurasian_Wolf
extends Wolves_Character

# Track almanac state
var can_show_almanac := true
var almanac_is_showing := false
var current_almanac = null

func _ready():
	Wolf_Name = WolfData._get_Eurasian_Wolf_Name()
	WolfAlmanac.setter_Wolf_Name(Wolf_Name)
	
func _process(delta):
	if is_player_nearby and Input.is_action_just_pressed("interaction"):
		rescue()

func rescue():
	if !can_show_almanac or almanac_is_showing:
		return
		
	emit_signal("wolf_rescue")
	Howling_SFX.play()
	print("The " + Wolf_Name + " have been rescued")
	show_alamanac()
	MissionStatData.update_wolf_rescue()
	visible = false
	can_show_almanac = false
	
func show_alamanac():
	if almanac_is_showing:
		return
		
	almanac_is_showing = true
	
	# Clean up any existing almanac
	if is_instance_valid(current_almanac):
		current_almanac.queue_free()
	
	# Set all almanac data
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Eurasian_Wolf_Image_Path())
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Eurasian_Wolf_Species())
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Eurasian_Wolf_Height())
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Eurasian_Wolf_Weight())
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Eurasian_Wolf_Lenght())
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Eastern_Wolf_Conservation_status())
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Eurasian_Wolf_Location())
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Eurasian_Wolf_Morphology())
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Eurasian_Wolf_Diets())
	WolfData._set_Eurasian_Wolf_Rescue_Status(true)
	
	   # Create and show almanac
	current_almanac = book_alamanac.instantiate()
	current_almanac.connect("tree_exited", _on_almanac_closed)
	
	var ui_layer = get_tree().root.get_node("World_Stages/UI/")
	if is_instance_valid(ui_layer):
		ui_layer.add_child(current_almanac)
	else:
		get_tree().root.add_child(current_almanac)
	
	_on_howling_finished()

func _on_almanac_closed():
	almanac_is_showing = false
	queue_free() # Remove the wolf after almanac closes

func _on_inside_the_wolf(body):
	if !can_show_almanac:
		return
		
	super._on_inside_the_wolf(body)
	Choirs.play()
	_on_choirs_finished()
	
func _on_choirs_finished():
	rescue()
