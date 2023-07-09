extends Node

var game_started = false
var health = 100
var energy=0
var ending="none"
var bullet=true
var cutscene=NAN

@export var ScareZoneScene: PackedScene
@export var BoulderAreaScene: PackedScene
@export var AttackZoneScene: PackedScene
@export var AreaAttack: PackedScene

var screen_size: Vector2

var AttackZoneArea

var KillEnemy = false
var matrixnum=1
var matrix=[
			[[0,0,1,1,1,0,0],
			[0,1,0,0,0,1,0],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[0,1,0,0,0,1,0],#0
			[0,0,1,1,1,0,0]],

			[[0,0,0,0,0,0,0],
			[0,0,1,0,0,0,0],
			[0,0,1,1,1,1,0],
			[0,0,1,1,1,0,0],
			[0,1,1,1,1,0,0],
			[0,0,0,0,1,0,0],#1
			[0,0,0,0,0,0,0]],
			
			[[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[1,1,1,1,1,1,1],#2
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0]],
			
			[[1,1,1,1,1,1,1],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],#3
			[1,1,1,1,1,1,1]],
			
			[[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],#4
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1]],
			
			[[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],#5
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1]]
			]

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	update_attscr()
	
func _enter_tree():
	$Enemy.position = $EnemyStartPositionMarker2D.position
	
func update_attscr():
	$"attack screen".create_screen(matrix[matrixnum])

func _input(event):
	if game_started:
		if event is InputEventMouseButton:
			if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
				var mouse_position = get_viewport().get_mouse_position()
				var ScareZoneSpawnLocation = mouse_position
				var ScareZone = ScareZoneScene.instantiate()
				get_tree().get_root().add_child(ScareZone)
				ScareZone.position = ScareZoneSpawnLocation
				energy-=.5
		
		
		
			if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT)and bullet:
				var curr = AreaAttack.instantiate()
				curr.matrix=(matrix[matrixnum])
				matrixnum=randi_range(0,matrix.size()-1)
				update_attscr()
				get_tree().get_root().add_child(curr)
				curr.position = get_viewport().get_mouse_position()
				#attack_pos=get_viewport().get_mouse_position()
				#$"Attack Timer".start()
				bullet=false
				$bullet_timer.start()
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0 and game_started:
		end("death")
	if energy<=0:energy=0
	if energy>=100:energy=100
	if cutscene.
	

func _on_hud_start_game():
	health = 100
	energy = 0
	game_started = true
	$"fight timer".start()


#func _on_enemy_about_to_die():
#	KillEnemy = true


#func _on_enemy_about_to_not_die():
#	KillEnemy = false
	

func end(ending):
	hide_field()
	print(ending)
	
	if ending=="death":
		cutscene=load("res://cat_dies_cut_scene.tscn").instantiate()
		add_child(cutscene)
	elif ending=="bored":
		cutscene=load("res://cat_bored_cut_scene.tscn").instantiate()
		add_child(cutscene)
	elif ending=="neutral":
		cutscene=load("res://cat_neutral_cut_scene.tscn").instantiate()
		add_child(cutscene)
	elif ending=="excited":
		cutscene=load("res://cat_dies_cut_scene.tscn").instantiate()
		add_child(cutscene)
	#$HUD.show_stuff()
	game_started = false
	
func menu():
	show_field()
	$HUD.show_stuff()


func _on_fight_timer_timeout():
	if game_started:
		if energy<=30:ending=end("bored")
		if energy<=60 and energy>=30:end("neutral")
		if energy>=60:end("exited")
		print("timeout")


func _on_bullet_timer_timeout():
	bullet=true

func hide_field():
	$"attack screen".hide()
	$"health bar".hide()
	$Ground.hide()
	$Enemy.hide()
	$Boss.hide()
	$"boulder container".hide()
	$"candle container".hide()
	$"fight timer/timerscreen".hide()
	$throne.hide()
	$"energy bar".hide()
	
func show_field():
	$"attack screen".show()
	$"health bar".show()
	$Ground.show()
	$Enemy.show()
	$Boss.show()
	$"boulder container".show()
	$"candle container".show()
	$"fight timer/timerscreen".show()
	$throne.show()
	$"energy bar".show()
