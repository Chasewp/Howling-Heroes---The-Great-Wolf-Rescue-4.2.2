class_name Wolf_Almanac_Menu_Index_Page_7
extends Wolf_Almanac_Main_Menu_Index

#Mackenzie River Wolf
@onready var MackenzieRiverWolfImage = $"Background/Almanac Index/WolfVBoxContainer19/Wolf 19"
@onready var MackenzieRiverWolfLabel = $"Background/Almanac Index/WolfVBoxContainer19/Label_Wolf_19"
var _MachenzieRiverWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Mackenzie River Wolf/mackenzie_river_wolf_almanac.tscn")

#Mexicaan Wolf
@onready var MexicanWolfImage = $"Background/Almanac Index/WolfVBoxContainer20/Wolf 20"
@onready var MexicanWolfLabel = $"Background/Almanac Index/WolfVBoxContainer20/Label_Wolf_20"
var _MexicanWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Mexican Wolf/mexican_wolf_almanac.tscn")

#Mongolian Wolf 
@onready var MongolianWolfImage = $"Background/Almanac Index/WolfVBoxContainer21/Wolf 21"
@onready var MongolianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer21/Label_Wolf_21"
var _MongolianWolfAlamnac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Mongolian Wolf/mongolian_wolf_almanac.tscn")

#Mackenzie River Wolf Image
func mackenzie_river_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Baffin_Island_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	MackenzieRiverWolfImage.texture_normal(texture)	
	
#Mexican Wolf Image
func mexican_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Baffin_Island_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	MexicanWolfImage.texture_normal(texture)	

#Mongolian Wolf
func mongolian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Baffin_Island_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	MongolianWolfImage.texture_normal(texture)	

func open_Mackenzie_River_Wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Mackenzie_River_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Mackenzie_River_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Mackenzie_River_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Mackenzie_River_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Mackenzie_River_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Mackenzie_River_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Mackenzie_River_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Mackenzie_River_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Mackenzie_River_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Mackenzie_River_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _MachenzieRiverWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Mackenzie_River_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_7()

func open_mexican_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Mexican_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Mexican_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Mexican_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Mexican_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Mexican_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Mexican_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Mexican_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Mexican_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Mexican_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Mexican_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _MexicanWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Mexican_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_7()

func open_mongolian_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Mongolian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Mongolian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Mongolian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Mongolian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Mongolian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Mongolian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Mongolian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Mongolian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Mongolian_Wolf_Diets())
	#WoLf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Mongolian_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _MongolianWolfAlamnac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Mongolian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_7()
	
func _ready():
	if WolfData._get_Mackenzie_River_Wolf_Rescue_Status() and WolfData._get_Mexican_Wolf_Rescue_Status() and WolfData._get_Mongolian_Wolf_Rescue_Status() == true:
		#Rescued
		MackenzieRiverWolfImage.disabled = false
		mackenzie_river_wolf_image()
		MackenzieRiverWolfLabel.disabled = false
		MackenzieRiverWolfLabel.text = WolfData._get_Mackenzie_River_Wolf_Name()
		MexicanWolfImage.disabled = false
		mexican_wolf_image()
		MexicanWolfLabel.disabled = false
		MexicanWolfLabel.text = WolfData._get_Mexican_Wolf_Name()
		MongolianWolfImage.disabled = false
		mongolian_wolf_image()
		MongolianWolfLabel.disabled = false
		MongolianWolfLabel.text = WolfData._get_Mongolian_Wolf_Name()
	else:
		#Not Rescued
		MackenzieRiverWolfImage.disabled = true
		MackenzieRiverWolfLabel.disabled = true
		MexicanWolfImage.disabled = true
		MexicanWolfLabel.disabled = true
		MongolianWolfImage.disabled = true
