class_name Wolf_Almanac_Index_Menu_Page_2
extends Wolf_Almanac_Main_Menu_Index

#Arctic Wolf
@onready var ArcticWolfImage = $"Background/Almanac Index/WolfVBoxContainer4/Wolf 4"
@onready var ArticWolfLabel  = $"Background/Almanac Index/WolfVBoxContainer4/Label_Wolf_4"
var _ArcticWolfAlmanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Arctic Wolf/arctic_wolf_almanac.tscn")

#Baffin Island Wolf
@onready var  BaffinIslandWolfImage = $"Background/Almanac Index/WolfVBoxContainer5/Wolf 5"
@onready var BaffinIslandWolfLabel = $"Background/Almanac Index/WolfVBoxContainer5/Label_Wolf_5"
var _BaffinIslanWolfAlamanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/Baffin Island Wolf/baffin_island_wolf_almanac.tscn")

#British Columbian Wolf
@onready var BritishColumbianWolfImage = $"Background/Almanac Index/WolfVBoxContainer6/Wolf 6"
@onready var BritishColumbianWolfLabel = $"Background/Almanac Index/WolfVBoxContainer6/Label_Wolf_6"
var _BritishColumbianWolfAlamanac = load("res://Assets/Scences/UI/Wolf_Almanac/Book/British Colombian Wolf/british_colombian_wolf_almanac.tscn")

func _ready():
	if WolfData._get_Arctic_Wolf_Rescue_Status() or  WolfData._get_Baffin_Island_Wolf_Rescue_Status() or WolfData._get_British_Columbian_Wolf_Rescue_Status() :
		#Recued
		ArcticWolfImage.set_disabled(false)
		artic_wolf_image()
		ArticWolfLabel.set_disabled(false)
		ArticWolfLabel.text = WolfData._get_Arctic_Wolf_Name()
		BaffinIslandWolfImage.set_disabled(false)
		baffin_wolf_image()
		BaffinIslandWolfLabel.set_disabled(false)
		BaffinIslandWolfLabel.text = WolfData._get_Baffin_Island_Wolf_Name()
		BritishColumbianWolfImage.set_disabled(false)
		british_columbian_wolf_image()
		BritishColumbianWolfLabel.set_disabled(false)
		BritishColumbianWolfLabel.text = WolfData._get_British_Columbian_Wolf_Name()
	else:
		#Not Rescued
		ArcticWolfImage.set_disabled(true)
		ArticWolfLabel.set_disabled(true)
		BaffinIslandWolfImage.set_disabled(true)
		BaffinIslandWolfLabel.set_disabled(true)
		BritishColumbianWolfImage.set_disabled(true)
		BritishColumbianWolfLabel.set_disabled(true)
		
func open_artic_wolf_almanac():
	button_sfx.play()
	#Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Arctic_Wolf_Name())	
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Arctic_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Arctic_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Arctic_Wolf_Height())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Arctic_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Arctic_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Arctic_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_Arctic_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_Arctic_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Arctic_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene= _ArcticWolfAlmanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Arctic_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_2()
	
func open_baffin_island_wolf():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_Baffin_Island_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_Baffin_Island_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_Baffin_Island_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_Baffin_Island_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_Baffin_Island_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_Baffin_Island_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_Baffin_Island_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_baffin_Island_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_baffin_Island_Wolf_Diets())
	#Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_Baffin_Island_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _BaffinIslanWolfAlamanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_Baffin_Island_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_2()

func open_british_columbian_wolf():
	button_sfx.play()
	# Wolf Name
	WolfAlmanac.setter_Wolf_Name(WolfData._get_British_Columbian_Wolf_Name())
	# Wolf Species
	WolfAlmanac.setter_Wolf_Species(WolfData._get_British_Columbian_Wolf_Species())
	# Wolf Height
	WolfAlmanac.setter_Wolf_Height(WolfData._get_British_Columbian_Wolf_Height())
	# Wolf Weight
	WolfAlmanac.setter_Wolf_Weight(WolfData._get_British_Columbian_Wolf_Weight())
	# Wolf Length
	WolfAlmanac.setter_Wolf_Lenght(WolfData._get_British_Columbian_Wolf_Lenght())
	# Wolf Conservation Status
	WolfAlmanac.setter_Wolf_Conservation_Status(WolfData._get_British_Columbian_Wolf_Conservation_Status())
	# Wolf Location
	WolfAlmanac.setter_Wolf_Region(WolfData._get_British_Columbian_Wolf_Location())
	# Wolf Morphology
	WolfAlmanac.setter_Wolf_Morphology(WolfData._get_British_Columbian_Wolf_Morphology())
	# Wolf Diet
	WolfAlmanac.setter_Wolf_Diets(WolfData._get_British_Columbian_Wolf_Diets())
	# Wolf Image
	WolfAlmanac.setter_Wolf_Image(WolfData._get_British_Columbian_Wolf_Image_Path())
	AlmanacOpenCloser.wolf_species_scene = _BritishColumbianWolfAlamanac
	AlmanacOpenCloser.wolf_species_name = WolfData._get_British_Columbian_Wolf_Name()
	AlmanacOpenCloser.open_wolf_species_page_2()
	
#Arctic Wolf Image
func artic_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Arctic_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	ArcticWolfImage.texture_normal = texture

#Baffin Wolf Image
func baffin_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_Baffin_Island_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	BaffinIslandWolfImage.texture_normal = texture	
	
#British Columbian Wolf
func british_columbian_wolf_image():
	var image = Image.load_from_file(str(WolfData._get_British_Columbian_Wolf_Image_Path()))
	var texture = ImageTexture.create_from_image(image)
	BritishColumbianWolfImage.texture_normal=texture	
	

