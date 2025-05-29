class_name Wolf_Almanac_Menu_Index_Page_4
extends Wolf_Almanac_Main_Menu_Index

#Great Plain Wolf
@onready var GreatPlainWolfImage = $"Background/Almanac Index/WolfVBoxContainer10/Wolf 10"
@onready var GreatPlainWolfLabel = $"Background/Almanac Index/WolfVBoxContainer10/Label_Wolf_10"
var _GreatPlainWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Great Plains Wolf/great_plains_wolf_almanac.tscn")

#Greenland Wolf
@onready var GreenlandWolfImage = $"Background/Almanac Index/WolfVBoxContainer11/Wolf 11"
@onready var GreenlandWolfLabel = $"Background/Almanac Index/WolfVBoxContainer11/Label_Wolf_11"
var _GreenlandWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Greenland Wolf/greenland_wolf_almanac.tscn")

#Himalayan Wolf
@onready var HimalayanWolfImage = $"Background/Almanac Index/WolfVBoxContainer12/Wolf 12"
@onready var HimalayanWolfLabel = $"Background/Almanac Index/WolfVBoxContainer12/Label_Wolf_12"
var _HimalayanWolf_Almanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Himalayan Wolf/himalayan_wolf_almanac.tscn")

func _ready():
	if WolfData._get_Great_Plains_Wolf_Rescue_Status() or WolfData._get_Greenland_Wolf_Rescue_Status() or WolfData._get_Himalyan_Wolf_Rescue_Status() :
		GreatPlainWolfImage.disabled = false
		great_plain_wolf_image()
		GreatPlainWolfLabel.disabled = false
		GreatPlainWolfLabel.text = WolfData._get_Great_Plains_Wolf_Name()
		GreenlandWolfImage.disabled = false
		great_plain_wolf_image()
		GreenlandWolfLabel.disabled = false
		GreenlandWolfLabel.text = WolfData._get_Greenland_Wolf_Name()
		HimalayanWolfImage.disabled = false
		himalayan_wolf_image()
		HimalayanWolfLabel.disabled = false
		HimalayanWolfLabel.text = WolfData._get_Himalayan_Wolf_Name()
	else:
		GreatPlainWolfImage.disabled = true
		GreatPlainWolfLabel.disabled = true
		GreenlandWolfImage.disabled = true
		GreenlandWolfLabel.disabled = true
		HimalayanWolfImage.disabled = true
		HimalayanWolfLabel.disabled = true

#Great Plain Wolf Image
func great_plain_wolf_image():
	var image = Image.load_from_file(WolfData._get_Great_Plains_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	GreatPlainWolfImage.texture_normal=texture

#Greenland Wolf Image
func greenland_wolf_image():
	var image = Image.load_from_file(WolfData._get_Greenland_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	GreenlandWolfImage.texture_normal=texture	

#Himalayan Wolf Image
func himalayan_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Himalayan_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	HimalayanWolfImage.texture_normal=texture

func open_great_plain_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Great_Plains_Wolf_Image_Path())
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Great_Plains_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Great_Plains_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Great_Plains_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Great_Plains_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Great_Plains_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Great_Plains_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Great_Plains_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Great_Plains_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Great_Plains_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene=_GreatPlainWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Great_Plains_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_4()
	
func open_greenland_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Greenland_Wolf_Image_Path())
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Greenland_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Greenland_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Greenland_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Greenland_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Greenland_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Greenland_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Greenland_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Greenland_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Greenland_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene = _GreenlandWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Greenland_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_4()
	
func open_himalayan_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Himalayan_Wolf_Image_Path())
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Himalayan_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Himalayan_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Himalayan_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Himalayan_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Himalayan_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Himalayan_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Himalayan_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Himalayan_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Himalayan_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene = _HimalayanWolf_Almanac
	AlmanacOpenCloser.wolf_species_name=WolfData._get_Himalayan_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_4()
