class_name Wolf_Almanac_Menu_Index_Page_9
extends Wolf_Almanac_Main_Menu_Index

# Steppe Wolf (Caspian Sea Wolf)
@onready var SteppeWolf_Caspian_Sea_WolfImage = $"Background/Almanac Index/WolfVBoxContainer25/Wolf 25"
@onready var SteppeWolf_Caspian_Sea_WolfLabel = $"Background/Almanac Index/WolfVBoxContainer25/Label_Wolf_25"
var _SteppeWolf_Caspian_Sea_WolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Steppe Wolf (Caspian Sea Wolf)/steppe_wolf_(caspian_sea_wolf)_almanac.tscn")

# Tundra Wolf
@onready var TundraWolfImage = $"Background/Almanac Index/WolfVBoxContainer26/Wolf 26"
@onready var TundraWolfLabel = $"Background/Almanac Index/WolfVBoxContainer26/Label_Wolf_26"
var _TundraWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Tundra Wolf/tundra_wolf_almanac.tscn")

# Vancouver Coastal Island Wolf
@onready var VancouverCoastalIslandWolfImage =  $"Background/Almanac Index/WolfVBoxContainer27/Wolf 27"
@onready var VancouverCoastalIslandWolfLabel = $"Background/Almanac Index/WolfVBoxContainer27/Label_Wolf_27"
var _VancouverWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Vancouver Coastal Island Wolf/vancouver_coastal_island_wolf_almanac.tscn")

func open_steppe_wolf_caspian_sea_wolf_almanac():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Steppe_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Steppe_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Steppe_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Steppe_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Steppe_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Steppe_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Steppe_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Steppe_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Steppe_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Steppe_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_almanac_scene = _SteppeWolf_Caspian_Sea_WolfAlmanac
	AlmanacOpenCloser.open_wolf_almanac()
	
func _open_tundra_wolf_almanac():
	button_sfx.play()
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
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Tundra_Wolf_Name())
	AlmanacOpenCloser.wolf_almanac_scene = _TundraWolfAlmanac
	AlmanacOpenCloser.open_wolf_almanac()

func open_vancouver_coastal_island_wolf():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Vancouver_Coastal_Island_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Vancouver_Coastal_Island_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Vancouver_Coastal_Island_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Vancouver_Coastal_Island_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Vancouver_Coastal_Island_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Vancouver_Coastal_Island_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Vancouver_Coastal_Island_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Vancouver_Coastal_Island_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Vancouver_Coastal_Island_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Vancouver_Coastal_Island_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_almanac_scene = _VancouverWolfAlmanac
	AlmanacOpenCloser.open_wolf_almanac()
	
func steppe_wolf_caspian_sea_wolf_image():
	var image = Image.load_from_file(WolfData._get_Steppe_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	SteppeWolf_Caspian_Sea_WolfImage.texture_normal=texture
	
func tundra_wolf_image():
	var image = Image.load_from_file(WolfData._get_Tundra_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	TundraWolfImage.texture_normal=texture

func vancouver_coastal_island_wolf_image():
	var image = Image.load_from_file(WolfData._get_Vancouver_Coastal_Island_Wolf_Image_Path())
	var texture = ImageTexture.create_from_image(image)
	VancouverCoastalIslandWolfImage.texture_normal=texture


func _ready():
	#Rescued
	if WolfData._get_Steppe_Wolf_Rescue_Status() or WolfData._get_Tundra_Wolf_Rescue_Status() or WolfData._get_Vancover_Coastal_Island_Wolf_Rescue_Status():
		steppe_wolf_caspian_sea_wolf_image()
		SteppeWolf_Caspian_Sea_WolfImage.disabled = false
		SteppeWolf_Caspian_Sea_WolfLabel.text = WolfData._get_Steppe_Wolf_Name()
		SteppeWolf_Caspian_Sea_WolfLabel.disabled = false
		tundra_wolf_image()
		TundraWolfImage.disabled = false
		TundraWolfLabel.text = WolfData._get_Tundra_Wolf_Name()
		TundraWolfLabel.disabled = false
		vancouver_coastal_island_wolf_image()
		VancouverCoastalIslandWolfImage.disabled = false
		VancouverCoastalIslandWolfLabel.text = WolfData._get_Vancouver_Coastal_Island_Wolf_Name()
		VancouverCoastalIslandWolfLabel.disabled = false

	#not Rescued
	else:
		SteppeWolf_Caspian_Sea_WolfImage.disabled = true
		SteppeWolf_Caspian_Sea_WolfLabel.disabled = true
		TundraWolfImage.disabled = true
		TundraWolfLabel.disabled = true
		VancouverCoastalIslandWolfImage.disabled = true
		VancouverCoastalIslandWolfLabel.disabled = true

