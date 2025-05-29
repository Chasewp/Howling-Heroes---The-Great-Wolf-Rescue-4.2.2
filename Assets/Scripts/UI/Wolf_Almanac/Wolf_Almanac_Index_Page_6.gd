class_name Wolf_Almanac_Menu_Index_Page_6
extends Wolf_Almanac_Main_Menu_Index

#Interior Alaskan Wolf (Yukon Wolf)
@onready var InteriorAlaskanWolfImage = $"Background/Almanac Index/WolfVBoxContainer16/Wolf 16"
@onready var InteriorAlaskanWolfLabel = $"Background/Almanac Index/WolfVBoxContainer16/Label_Wolf_16"
var _InteriorAlaskanWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Interior Alaskan Wolf (Yukon Wolf)/interior_alaskan_wolf_(yukon_wolf)_almanac.tscn")

#Italian Wolf
@onready var ItalianWolfImage = $"Background/Almanac Index/WolfVBoxContainer17/Wolf 17"
@onready var ItalianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer17/Label_Wolf_17"
var _ItalianWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Italian Wolf/italian_wolf_almanac.tscn")

#Labrador Wolf
@onready var LabradorWolfImage = $"Background/Almanac Index/WolfVBoxContainer18/Wolf 18"
@onready var LabradorWolfLabel = $"Background/Almanac Index/WolfVBoxContainer18/Label_Wolf_18"
var _LabradorWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Labrador Wolf/labrador_wolf_almanac.tscn")

#Interior Alaskan Wolf Image
func interior_alaskan_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Interior_Alaskan_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	InteriorAlaskanWolfImage.texture_normal=texture	

#Italian Wolf Image
func italian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Italian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	ItalianWolfImage.texture_normal+texture	

#Labrador Wolf Image
func labrador_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Baffin_Islz_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	LabradorWolfImage.texture_normal=texture

func open_interior_alaskan_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Interior_Alaskan_Wolf_Image_Path())
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Interior_Alaskan_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Interior_Alaskan_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Interior_Alaskan_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Interior_Alaskan_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Interior_Alaskan_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Interior_Alaskan_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Interior_Alaskan_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Interior_Alaskan_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Interior_Alaskan_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene=_InteriorAlaskanWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Interior_Alaskan_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_6()
	
func open_italian_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Italian_Wolf_Image_Path()) 
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Italian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Italian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Italian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Italian_Wolf_Height())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Italian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Italian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Italian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Italian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Italian_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene = _ItalianWolfAlmanac
	AlmanacOpenCloser.open_wolf_species_page_6()
	
func open_labrador_wolf_alamanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Labrador_Wolf_Image_Path())
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Labrador_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Labrador_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Labrador_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Labrador_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Labrador_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Labrador_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Labrador_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Labrador_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Labrador_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene= _LabradorWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Labrador_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_6()
	
func _ready():
	if WolfData._get_Interior_Alaskan_Wolf_Rescue_Status() or WolfData._get_Italian_Wolf_Rescue_Status() or WolfData._get_Labrador_Wolf_Rescue_Status() == true:
		#Rescued
		InteriorAlaskanWolfImage.disabled = false
		interior_alaskan_wolf_image()
		InteriorAlaskanWolfLabel.disabled = false
		InteriorAlaskanWolfLabel.text = WolfData._get_Interior_Alaskan_Wolf_Name()
		ItalianWolfImage.disabled = false
		italian_wolf_image()
		ItalianWolfLabel.disabled = false
		ItalianWolfLabel.text = WolfData._get_Italian_Wolf_Name()
		LabradorWolfImage.disabled = false
		labrador_wolf_image()
		LabradorWolfLabel.disabled = false
		LabradorWolfLabel.text = WolfData._get_Labrador_Wolf_Name()
	else:
		#not Rescued
		InteriorAlaskanWolfImage.disabled = true
		InteriorAlaskanWolfLabel.disabled = true
		ItalianWolfImage.disabled = true
		ItalianWolfLabel.disabled = true
		LabradorWolfImage.disabled = true
		LabradorWolfLabel.disabled = true
