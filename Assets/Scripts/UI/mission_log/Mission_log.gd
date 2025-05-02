class_name mission_log
extends Control

signal reset 

@onready var Label_Wolf_Rescue = %LBL_WR
@onready var Total_Wolf_Rescue_Label = %TLT_WR
@onready var Label_Enemy_Executed = %LBL_EE
@onready var total_enemy_executed_label = %TLT_EE
@onready var Label_Boss_Elimited = %LBL_BE
@onready var total_boss_eleminated_Label = %TLT_BE

@export var wolf_total_taiga : int
@export var boss_total_taiga : int
@export var enemy_total_taiga : int
@export var wolf_total_tundra : int
@export var boss_total_tundra : int
@export var enemy_total_tundra : int
@export var wolf_total_grassland : int
@export var boss_total_grassland : int
@export var enemy_total_grassland : int
@export var wolf_total_dessert : int
@export var boss_total_dessert : int
@export var enemy_total_dessert : int

var data = load("user://Save/Progress/Save_Progress.tres")

func _init():
	#Taiga
	wolf_total_taiga = 10
	boss_total_taiga = 10
	enemy_total_taiga = 320
	
	#Tundra
	wolf_total_tundra = 5
	boss_total_tundra = 5
	enemy_total_tundra = 225
	
	#Grassland
	wolf_total_grassland = 8
	boss_total_grassland = 8 
	enemy_total_grassland = 384
	
	#Dessert
	wolf_total_dessert = 4
	boss_total_dessert = 4
	enemy_total_dessert = 70
	
func _ready():
	var wolves = get_tree().get_nodes_in_group("wolves")
	for wolf in wolves:
		wolf.connect("wolf_rescued",Callable(MissionStatData, "update_wolf_rescue"))
		
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemiy in enemies:
		enemiy.connect("executed",Callable(MissionStatData,"update_enemy_kills"))
	
	var bossies =  get_tree().get_nodes_in_group("boss")
	for boss in bossies:
		boss.connect("executed",Callable(MissionStatData,"update_boss_kills"))


	if data is Data_Progress:
		player_singleton_autoload.setter_location(data.player_biome_location)
		if player_singleton_autoload.location == "Taiga":
			MissionStatData.set_total_wolves_rescued(wolf_total_taiga)
			MissionStatData.set_total_boss_killed(boss_total_taiga)
			MissionStatData.set_total_enemies_killed(enemy_total_taiga)
			Label_Wolf_Rescue.set_text(str(MissionStatData.wolf_rescued))
			Total_Wolf_Rescue_Label.set_text(str(MissionStatData.total_wolves_rescued))
			Label_Enemy_Executed.set_text(str(MissionStatData.enemy_kill))
			total_enemy_executed_label.set_text(str(MissionStatData.total_enemies_killed))
			Label_Boss_Elimited.set_text(str(MissionStatData.boss_kill))
			total_boss_eleminated_Label.set_text(str(MissionStatData.total_boss_killed))
			
	
		elif player_singleton_autoload.location == "Tundra":
			MissionStatData.set_total_wolves_rescued(wolf_total_tundra)
			MissionStatData.set_total_boss_killed(boss_total_tundra)       
			MissionStatData.set_total_enemies_killed(enemy_total_tundra)
			Label_Wolf_Rescue.set_text(str(MissionStatData.wolf_rescued))
			Total_Wolf_Rescue_Label.set_text(str(MissionStatData.total_wolves_rescued))
			Label_Enemy_Executed.set_text(str(MissionStatData.enemy_kill))
			total_enemy_executed_label.set_text(str(MissionStatData.total_enemies_killed))
			Label_Boss_Elimited.set_text(str(MissionStatData.boss_kill))
			total_boss_eleminated_Label.set_text(str(MissionStatData.total_boss_killed))
		
		elif player_singleton_autoload.location == "Grassland":
			MissionStatData.set_total_wolves_rescued(wolf_total_grassland)
			MissionStatData.set_total_boss_killed(boss_total_grassland)
			MissionStatData.set_total_enemies_killed(enemy_total_grassland)
			Label_Wolf_Rescue.set_text(str(MissionStatData.wolf_rescued))
			Total_Wolf_Rescue_Label.set_text(str(MissionStatData.total_wolves_rescued))
			Label_Enemy_Executed.set_text(str(MissionStatData.enemy_kill))
			total_enemy_executed_label.set_text(str(MissionStatData.total_enemies_killed))
			Label_Boss_Elimited.set_text(str(MissionStatData.boss_kill))
			total_boss_eleminated_Label.set_text(str(MissionStatData.total_boss_killed))
		else :
			MissionStatData.set_total_wolves_rescued(wolf_total_dessert)
			MissionStatData.set_total_boss_killed(boss_total_dessert)
			MissionStatData.set_total_enemies_killed(enemy_total_dessert)
			Label_Wolf_Rescue.set_text(str(MissionStatData.wolf_rescued))
			Total_Wolf_Rescue_Label.set_text(str(MissionStatData.total_wolves_rescued))
			Label_Enemy_Executed.set_text(str(MissionStatData.enemy_kill))
			total_enemy_executed_label.set_text(str(MissionStatData.total_enemies_killed))
			Label_Boss_Elimited.set_text(str(MissionStatData.boss_kill))
			total_boss_eleminated_Label.set_text(str(MissionStatData.total_boss_killed))
			
	else : 
		print("Failed to load resource data.")
	
	MissionStatData.connect("enemy_kill_updated", Callable(self, "_on_enemy_kill_updated"))
	MissionStatData.connect("wolf_rescue_updated",Callable(self,"_on_wolf_rescue_updated"))
	MissionStatData.connect("boss_kill_updated",Callable(self,"_on_boss_kill_updated"))
	MissionStatData.connect("reset",Callable(self,"reset_data"))
	
func _on_enemy_kill_updated(new_count):
	Label_Enemy_Executed.text = str(new_count)

func _on_wolf_rescue_updated(new_count):
	Label_Wolf_Rescue.text=str(new_count)
	
func _on_boss_kill_updated(new_count):
	Label_Boss_Elimited.text = str(new_count)
func _process(delta):
	if Input.is_action_just_pressed("mission_log"):  
		toggle_mission_log()
				
func toggle_mission_log():
	self.visible = !self.visible
		

func reset_data(new_count1,new_count2,new_count3):
	new_count1=0
	new_count2=0
	new_count3= 0
	Label_Wolf_Rescue.set_text(str(new_count1))
	Total_Wolf_Rescue_Label.set_text(str(new_count1))
	Label_Enemy_Executed.set_text(str(new_count2))
	total_enemy_executed_label.set_text(str(new_count2))
	Label_Boss_Elimited.set_text(str(new_count3))
	total_boss_eleminated_Label.set_text(str(new_count3))
	
