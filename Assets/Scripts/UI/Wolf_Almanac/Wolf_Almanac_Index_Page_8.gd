class_name Wolf_Almanac_Menu_Index_Page_8
extends Wolf_Almanac_Main_Menu_Index

#Northern Rocky Mountain Wolf
@onready var NorthernRockyMountainWolfImage = $"Background/Almanac Index/WolfVBoxContainer22/Wolf 22"
@onready var NorthernRockyMountainWolfLabel = $"Background/Almanac Index/WolfVBoxContainer22/Label_Wolf_22"
var _NorthernRockyMountainWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Northern Rocky Mountain Wolf/northern_rocky_mountain_wolf_almanac.tscn")

#Northwestern Wolf
@onready var NorthwesternWolfImage = $"Background/Almanac Index/WolfVBoxContainer23/Wolf 23"
@onready var NorthwesternWolfLabel  = $"Background/Almanac Index/WolfVBoxContainer23/Label_Wolf_23"
var _NorthwesternWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Northwestern Wolf/northwestern_wolf_almanac.tscn")

# Red Wolf
@onready var RedWolfImage = $"Background/Almanac Index/WolfVBoxContainer24/Wolf 24"
@onready var RedWolfLabel = $"Background/Almanac Index/WolfVBoxContainer24/Label_Wolf_24"
var _RedWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Red Wolf/red_wolf_almanac.tscn")

# Northern Rocky Mountain Wolf Image
func northern_rocky_mountain_wolf_image():
	var image = Image.load_from_file(WolfData._get_Northern_Rocky_Mountain_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	NorthernRockyMountainWolfImage.texture_normal(texture)

# Northwestern Wolf
func northwestern_wolf_image():
	var image = Image.load_from_file(WolfData._get_Northern_Rocky_Mountain_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	NorthernRockyMountainWolfImage.texture_normal(texture)

# Red Wolf Image
func red_wolf_image():
	var image = Image.load_from_file(WolfData._get_Northern_Rocky_Mountain_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	NorthernRockyMountainWolfImage.texture_normal(texture)

func open_northern_rocky_mountain_wolf_almanac():
	button_sfx.play()
	# Wolf name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Northern_Rocky_Mountain_Wolf_Name())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Northern_Rocky_Mountain_Wolf_Image_Path())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Northern_Rocky_Mountain_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Northern_Rocky_Mountain_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Northern_Rocky_Mountain_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Northern_Rocky_Mountain_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Northern_Rocky_Mountain_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Northern_Rocky_Mountain_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Northern_Rocky_Mountain_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Northern_Rocky_Mountain_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene = _NorthernRockyMountainWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Northern_Rocky_Mountain_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_8()

func open_northwestern_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Northwestern_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Northwestern_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Northwestern_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Northwestern_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Northwestern_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Northwestern_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Northwestern_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Northwestern_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Northwestern_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Northwestern_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _NorthwesternWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Northwestern_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_8()

func open_red_wolf_alamanac():
	button_sfx.play()
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Red_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Red_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Red_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Red_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Red_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Red_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Red_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Red_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Red_Wolf_Image_Path())
	# WolF Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Red_Wolf_Name())
	AlmanacOpenCloser.wolf_species_scene = _RedWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Red_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_8()
	
func _ready():
	# Recsued
	if WolfData._get_Nortern_Rocky_Mountain_Wolf_Rescue_Status() and WolfData._get_Northwestern_Wolf_Rescue_Status() and WolfData._get_Red_Wolf_Rescue_Status():
		northern_rocky_mountain_wolf_image()
		NorthernRockyMountainWolfImage.disabled = false
		NorthwesternWolfLabel.text = WolfData._get_Northern_Rocky_Mountain_Wolf_Name()
		NorthernRockyMountainWolfLabel.disabled = false
		northwestern_wolf_image()
		NorthwesternWolfImage.disabled = false
		NorthwesternWolfLabel.text = WolfData._get_Northwestern_Wolf_Name()
		NorthwesternWolfLabel.disabled = false
		red_wolf_image()
		RedWolfImage.disabled = false
		RedWolfLabel.text = WolfData._get_Red_Wolf_Name()
		RedWolfLabel.disabled = false
	else:
	# not Rescued
		NorthernRockyMountainWolfImage.disabled = true
		NorthernRockyMountainWolfLabel.disabled = true
		NorthwesternWolfImage.disabled = true
		NorthwesternWolfLabel.disabled = true
		RedWolfImage.disabled = true
		RedWolfLabel.disabled = true
