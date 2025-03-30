class_name Wolf_Almanac_Menu_Index_Page_1
extends Wolf_Almanac_Main_Menu_Index

#Alaskan Tundra Wolf 
@onready var AlaskanTundraWolfImage = $"Background/Almanac Index/WolfVBoxContainer1/Wolf 1"
@onready var AlaskanTundraWolfLabel = $"Background/Almanac Index/WolfVBoxContainer1/Label_Wolf_1"
var _AlaskanTundaWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Alaskan Tundra Wolf/alaskan_tundra_wolf_almanac.tscn")

#Alexander Archipelago Wolf
@onready var AlexanderArchipelagoWolfImage = $"Background/Almanac Index/WolfVBoxContainer2/Wolf 2"
@onready var AlexaanderArchipelagoWolfLabel = $"Background/Almanac Index/WolfVBoxContainer2/Label_Wolf_2"
var _AlexanderArchipelagoWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Alexander Archipelago Wolf/alexander_archipelago_wolf_almanac.tscn")

#Arabian Wolf
@onready var ArabianWolfImage = $"Background/Almanac Index/WolfVBoxContainer3/Wolf 3"
@onready var ArabianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer3/Label_Wolf_3"
var _ArabianWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Arabian Wolf/arabian_wolf_almanac.tscn")


func _ready():
	#rescued
	if WolfData._get_Alaskan_Tundra_Wolf_Rescue_Status() and WolfData._get_Alexander_Archipelago_Wolf_Rescue_Status() and WolfData._get_Arabian_Wolf_Rescue_Status()==true:
		AlaskanTundraWolfImage.set_disabled(false)
		alaskan_tundra_wolf_image()
		AlaskanTundraWolfLabel.text = WolfData._get_Alaskan_Tundra_Wolf_Name()
		AlaskanTundraWolfLabel.set_disabled(false)
		AlexanderArchipelagoWolfImage.set_disabled(false)
		alexander_archipelago_wolf_image()
		AlexaanderArchipelagoWolfLabel.text = WolfData._get_Alexander_Archipelago_Wolf_Name()
		AlexaanderArchipelagoWolfLabel.set_disabled(false)
		ArabianWolfImage.set_disabled(false)
		arabian_wolf_image()
		ArabianWolfLabel.set_disabled(false)
		ArabianWolfLabel.text = WolfData._get_Arabian_Wolf_Name()
		
	#Not Rescued
	else:
		AlaskanTundraWolfImage.set_disabled(true)
		AlaskanTundraWolfLabel.set_disabled(true)
		AlexaanderArchipelagoWolfLabel.set_disabled(true)
		AlexanderArchipelagoWolfImage.set_disabled(true)
		ArabianWolfImage.set_disabled(true)
		ArabianWolfLabel.set_disabled(true)
		
func open_alaskan_tundra_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Alaskan_Tundra_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Alaskan_Tundra_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Alaskan_Tundra_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Alaskan_Tundra_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Alaskan_Tundra_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Alaskan_Tundra_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Alaskan_Tundra_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Alaskan_Tundra_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Alaskan_Tundra_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Alaskan_Tundra_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _AlaskanTundaWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Alaskan_Tundra_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_1()
	
func open_alexander_archipelago_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Alexander_Archipelago_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Alexander_Archipelago_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Alexander_Archipelago_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Alexander_Archipelago_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Alexander_Archipelago_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Alexander_Archipelago_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Alexander_Archipelago_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Alexander_Archipelago_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Alexander_Archipelago_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Alexander_Archipelago_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _AlexanderArchipelagoWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Alexander_Archipelago_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_1()
	
func open_Arabian_Wolf_Almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Arabian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Arabian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Arabian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Arabian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Arabian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Arabian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Arabian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Arabian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Arabian_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Arabian_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _ArabianWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Arabian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_1()
	

#Alaskan Tundra Wolf Image
func alaskan_tundra_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Alaskan_Tundra_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	AlaskanTundraWolfImage.texture_normal(texture)	

#Alexander Archipelago Wolf Image
func alexander_archipelago_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Alexander_Archipelago_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	AlexanderArchipelagoWolfImage.texture_normal(texture)	

#Arabian Wolf Image
func arabian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Arabian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	ArabianWolfImage.texture_normal(texture)	
