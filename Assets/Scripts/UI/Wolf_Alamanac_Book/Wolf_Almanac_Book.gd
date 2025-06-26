"""Wolf WolfAlmanac Book"""
class_name Wolf_WolfAlmanac_Book
extends Node

"Cursor"
var normal_cursor = load("res://Assets/Image/Cursor/Cursor 32x32.png")
var hand_cursor = load("res://Assets/Image/Cursor/hand_paw.png")
var background_image_path = "res://Assets/Image/Background/UI/Wolf_Alamac_Book/opened_notebook_isolated_on_background.png"

#background
@onready var background = $Book_Texturee
#Wolf Picture
@onready var wolf_Picture = $Wolf_Picture
#Wolf Name
@onready var name_Wolf = $Name_Wolf
#Wolf Species
@onready var species = $Species
#Wolf Height
@onready var height = $Height_Label
#Wolf Weight
@onready var weight = $Weight_Label
#Wolf Lenght
@onready var lenght = $Leght_Label
#Wolf Status
@onready var status = $Status
#Wolf Region List
@onready var region = $Region_List
#Wolf Morphology
@onready var morphology = $MORPHOLOGY_details
#Wolf Diets List
@onready var diets = $Diets_List
#Back butoons
@onready var backbtn = $TextureButton

func _ready():
	set_background(background_image_path)
	set_wolf_image(WolfAlmanac.wolf_image)
	name_Wolf.set_text(WolfAlmanac.wolf_name)
	species.set_text(WolfAlmanac.wolf_species)
	height.set_text(WolfAlmanac.wolf_height)
	weight.set_text(WolfAlmanac.wolf_weight)
	lenght.set_text(WolfAlmanac.wolf_lenght)
	status.set_text(WolfAlmanac.wolf_conservation_status)
	region.set_text(WolfAlmanac.wolf_region)
	morphology.set_text(WolfAlmanac.wolf_morphology)
	diets.set_text(WolfAlmanac.wolf_diets)
#
	
#set Wolves Image
func set_wolf_image(img)->void:
	var image = Image.load_from_file(img)
	var texture = ImageTexture.create_from_image(image)
	wolf_Picture.set_texture(texture)

#set Background
func set_background(img)-> void:
	var images = Image.load_from_file(img)
	var textures = ImageTexture.create_from_image(images)
	background.set_texture(textures)

#quit Wolf WolfAlmanac
func _on_back_button_pressed()->void:
		queue_free()
	
func on_mouse_entered()-> void:
	Input.set_custom_mouse_cursor(hand_cursor)
	
func on_mouse_exited()->void:
	Input.set_custom_mouse_cursor(normal_cursor)
