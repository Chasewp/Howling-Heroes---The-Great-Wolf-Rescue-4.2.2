"""Singleton <AutoLoad> - Alamac Variable"""

class_name Wolf_Alamanac_Variable_Singleton
extends Node

@export_category("Almanac Data")
@export var wolf_image : String : set = setter_Wolf_Image
@export var wolf_name : String : set = setter_Wolf_Name
@export var wolf_species : String : set = setter_Wolf_Species
@export var wolf_height : String : set = setter_Wolf_Height
@export var wolf_weight  : String : set = setter_Wolf_Weight 
@export var wolf_lenght : String : set = setter_Wolf_Lenght
@export var wolf_conservation_status : String : set = setter_Wolf_Conservation_Status
@export var wolf_region : String : set = setter_Wolf_Region
@export var wolf_morphology : String : set = setter_Wolf_Morphology
@export var wolf_diets : String : set = setter_Wolf_Diets

# Setter Data
#Wolf Image
func setter_Wolf_Image(img):
	wolf_image = img

#Wolf Name
func setter_Wolf_Name(nmn_wolf):
	wolf_name = nmn_wolf

#Species
func setter_Wolf_Species(sps):
	wolf_species = sps

#Height
func setter_Wolf_Height(hgt):
	wolf_height = hgt
	
#Weight
func setter_Wolf_Weight(wgt):
	wolf_weight = wgt

#Lenght
func setter_Wolf_Lenght(lgh):
	wolf_lenght = lgh

#Conservation Status
func setter_Wolf_Conservation_Status(sts):
	wolf_conservation_status = sts

#Region
func setter_Wolf_Region(rgn):
	wolf_region = rgn

#Morphology
func setter_Wolf_Morphology(mfl):
	wolf_morphology = mfl

#Diets
func setter_Wolf_Diets(dts):
	wolf_diets = dts
