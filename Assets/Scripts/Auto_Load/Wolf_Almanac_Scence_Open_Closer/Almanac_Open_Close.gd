"""Singleton <AutoLoad> - Almanac Variable"""
class_name Wolf_Almanac_Open_Closer_Singleton
extends Node

# Export variables for the Wolf Almanac scene
@export var wolf_almanac_scene: PackedScene
@export var wolf_species_scene: PackedScene  # Scene for species details
@export var page : String
@export var wolf_species_name : String
# Variables to store scene instances
var current_menu = null
var current_species = null

func open_wolf_page_almanac():
	if current_menu != null:
		return  # The menu is already open, no need to reload it

	# Load the Wolf Almanac scene from PackedScene
	if wolf_almanac_scene:
		print("Instantiating the Wolf Almanac Index scene...")
		current_menu = wolf_almanac_scene.instantiate()
		
		# Add the Wolf Almanac as a child of Almanac_Main_Menu
		var ui_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu")
		if ui_node:
			print("Adding the Wolf Almanac Index Page " + page + " to Almanac_Main_Menu...")
			ui_node.add_child(current_menu)
			current_menu.visible = true
			print("Wolf Almanac Index Page " + page + " successfully added and displayed.")
		
		# Pause the game
		get_tree().paused = true

func close_wolf_almanac():
	if current_menu != null:
		# Remove the Wolf Almanac scene
		current_menu.queue_free()
		current_menu = null
		
		# Unpause the game
		get_tree().paused = false

# Open species details
func open_wolf_species_page_6():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage6
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlmanacIndexPage6")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")
			
func open_wolf_species_page_1():
	if current_species != null:
		return  # Species details are already open, no need to reload		
		
	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlamacIndexPage1")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")
			
func open_wolf_species_page_2():
	if current_species != null:
		return  # Species details are already open, no need to reload
	# Load species details scene from PackedScene
	if wolf_species_scene:
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		current_species = wolf_species_scene.instantiate()
		
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlamacIndexPage2")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")

func open_wolf_species_page_3():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlamacIndexPage3")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")

func open_wolf_species_page_4():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlamacIndexPage4")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")

func open_wolf_species_page_5():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlmanacIndexPage5")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")

func open_wolf_species_page_7():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlmanacIndexPage7")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")
			
func open_wolf_species_page_8():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlmanacIndexPage8")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")

func open_wolf_species_page_9():
	if current_species != null:
		return  # Species details are already open, no need to reload

	# Load species details scene from PackedScene
	if wolf_species_scene:
		current_species = wolf_species_scene.instantiate()
		print("Instantiating the " + wolf_species_name+ " Almanac scene...")
		# Add the species detail as a child of WolfAlmanacIndexPage1
		var page_node = get_tree().root.get_node("World_Stages/UI/Almanac_Main_Menu/WolfAlmanacIndexPage9")
		if page_node:
			print("Adding " + wolf_species_name + " Almanac Book" + " to " + "Wolf Almanac Index Page "  + page + "...")
			page_node.add_child(current_species)
			current_species.visible = true
			print(wolf_species_name + " Almanac Book" + " successfully added and displayed.")
