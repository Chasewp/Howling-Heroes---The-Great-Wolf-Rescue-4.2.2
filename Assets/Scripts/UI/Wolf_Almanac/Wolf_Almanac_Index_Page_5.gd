class_name Wolf_Almanac_Menu_Index_Page_5
extends Wolf_Almanac_Main_Menu_Index

#Hudson Bay Wolf
@onready var HudsonBayWolfImage = $"Background/Almanac Index/WolfVBoxContainer13/Wolf 13"
@onready var HudsonBayWolfLabel = $"Background/Almanac Index/WolfVBoxContainer13/Label_Wolf_13"
var _HudsonBayWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Hudson Bay Wolf/hudson_bay_wolf_almanac.tscn")

#Iberian Wolf
@onready var IberianWolfImage = $"Background/Almanac Index/WolfVBoxContainer14/Wolf 14"
@onready var IberianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer14/Label_Wolf_14"
var _IberianWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Iberian Wolf/iberian_wolf_almanac.tscn")

#Indian Wolf
@onready var IndianWolfImage = $"Background/Almanac Index/WolfVBoxContainer15/Wolf 15"
@onready var IndianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer15/Label_Wolf_15"
var _IndianWolfAlamanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Indian Wolf/indian_wolf_almanac.tscn")

#Hudson Bay Wolf Image
func hudson_bay_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Hudson_Bay_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	HudsonBayWolfImage.texture_normal(texture)	
	
#Iberian Wolf Image
func iberian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Iberian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	IberianWolfImage.texture_normal(texture)	

#Indian Wolf Image
func indian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Indian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	IndianWolfImage.texture_normal(texture)	
	
func open_hudson_bay_wolf_almanac():
	button_sfx.play()
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Hudson_Bay_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Hudson_Bay_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Hudson_Bay_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Hudson_Bay_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Hudson_Bay_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Hudson_Bay_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Hudson_Bay_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Hudson_Bay_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Hudson_Bay_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Hudson_Bay_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _HudsonBayWolfAlmanac	
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Hudson_Bay_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_5()
	
func open_iberian_wolf_almanac():
	button_sfx.play()
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Iberian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Iberian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Iberian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Iberian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Iberian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Iberian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Iberian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Iberian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Iberian_Wolf_Diets())
	# Wolf Immage
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Iberian_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _IberianWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Iberian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_5()

func open_indian_wolf_almanac():
	button_sfx.play()
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Indian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Indian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Indian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Indian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Indian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Indian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Indian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Indian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Indian_Wolf_Diets())
	# Wolf Immage 
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Indian_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_almanac_scene = _IndianWolfAlamanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Indian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_5()
	
func _ready():
	if WolfData._get_Hudsom_Bay_Wolf_Rescue_Status() and WolfData._get_Iberian_Wolf_Rescue_Status() and WolfData._get_Indian_Wolf_Rescue_Status() == true:
	#Rescued
		HudsonBayWolfImage.disabled = false
		hudson_bay_wolf_image()
		HudsonBayWolfLabel.disabled = false
		HudsonBayWolfLabel.text = WolfData._get_Hudson_Bay_Wolf_Name()
		IberianWolfImage.disabled = false
		iberian_wolf_image()
		IberianWolfLabel.disabled = false
		IberianWolfLabel.text = WolfData._get_Iberian_Wolf_Name()
		IndianWolfImage.disabled = false
		indian_wolf_image()
		IndianWolfLabel.disabled = false
		IndianWolfLabel.text = WolfData._get_Indian_Wolf_Name()
	else: 
	#non Rescued
		HudsonBayWolfImage.disabled = true
		HudsonBayWolfLabel.disabled = true
		IberianWolfImage.disabled = true
		IberianWolfLabel.disabled = true
		IndianWolfImage.disabled = true
		IndianWolfLabel.disabled = true
