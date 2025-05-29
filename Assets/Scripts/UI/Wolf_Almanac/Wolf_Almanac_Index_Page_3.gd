class_name Wolf_Alamanac_Menu_Index_Page_3
extends Wolf_Almanac_Main_Menu_Index


#Eastern Wolf
@onready var EasternWolfImage = $"Background/Almanac Index/WolfVBoxContainer7/Wolf 7"
@onready var EasternWolfLabel = $"Background/Almanac Index/WolfVBoxContainer7/Label_Wolf_7"
var _EasternWolfAlmanac= load("res://Assets/Scences/UI/Wolf_Almanac/Book/Eastern Wolf/eastern_wolf_almanac.tscn")

#Eurasian Wolf
@onready var EurasianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer8/Wolf 8"
@onready var EurasianWolfImage = $"Background/Almanac Index/WolfVBoxContainer8/Label_Wolf_8"
var _EurasianWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Eurasian Wolf/eurasian_wolf_almanac.tscn")

#Gray Wolf
@onready var GrayWolfImage = $"Background/Almanac Index/WolfVBoxContainer9/Wolf 9"
@onready var GrayWolfLabel = $"Background/Almanac Index/WolfVBoxContainer9/Label_Wolf_9"
var _GrayWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Gray Wolf/gray_wolf_almanac.tscn")

func _ready():
	if WolfData._get_Eastern_Wolf_Rescue_Status() or WolfData._get_Eurasian_Wolf_Rescue_Status() or WolfData._get_Gray_Wolf_Rescue_Status() == true:
		#Rescued
		EasternWolfImage.set_disabled(false)
		eastern_wolf_image()
		EasternWolfLabel.set_disabled(false)
		EasternWolfLabel.text = WolfData._get_Eastern_Wolf_Name()
		EurasianWolfImage.set_disabled(false)
		eurasian_wolf_image()
		EurasianWolfLabel.set_disabled(false)
		EurasianWolfLabel.text = WolfData._get_Eurasian_Wolf_Name()
		GrayWolfImage.set_disabled(false)
		gray_wolf_image()
		GrayWolfLabel.set_disabled(false)
		GrayWolfLabel.text = WolfData._get_Gray_Wolf_Name()
	else:
		#Not Rescued
		EasternWolfImage.set_disabled(true)
		EasternWolfLabel.set_disabled(true)
		EurasianWolfImage.set_disabled(true)
		EurasianWolfLabel.set_disabled(true)
		GrayWolfImage.set_disabled(true)
		GrayWolfLabel.set_disabled(true)

#Eastern Wolf Image
func eastern_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Eastern_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	EasternWolfImage.texture_normal=texture	
		
#Eurasian Wolf Image
func eurasian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Eurasian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	EurasianWolfImage.texture_normal=texture	

#Gray Wolf Image
func gray_wolf_image() :
	var image = Image.load_from_file(str(WolfData._get_Gray_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	GrayWolfImage.texture_normal=texture
	
func open_eastern_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Eastern_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Eastern_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Eastern_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Eastern_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Eastern_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Eastern_Wolf_Conservation_status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Eastern_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Eastern_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Eastern_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Eastern_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _EasternWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Eastern_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_3()

func open_eurasian_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Eurasian_Wolf_Image_Path())
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Eurasian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Eurasian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Eurasian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Eurasian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Eurasian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Eastern_Wolf_Conservation_status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Eurasian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Eurasian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Eurasian_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene  = _EurasianWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Eurasian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_3()

func open_gray_wolf_almanac():
	button_sfx.play()
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Gray_Wolf_Image_Path())
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Gray_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Gray_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Gray_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Gray_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Gray_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Gray_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Gray_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Gray_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Gray_Wolf_Diets())
	AlmanacOpenCloser.wolf_species_scene = _GrayWolfAlmanac
	AlmanacOpenCloser.open_wolf_species_page_3()
