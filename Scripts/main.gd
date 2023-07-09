extends Node

var game_started = false
var health = 100
var energy=0

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
		
		
		
			if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT):
				var curr = AreaAttack.instantiate()
				curr.matrix=(matrix[matrixnum])
				matrixnum=randi_range(0,matrix.size()-1)
				update_attscr()
				get_tree().get_root().add_child(curr)
				curr.position = get_viewport().get_mouse_position()
				#attack_pos=get_viewport().get_mouse_position()
				#$"Attack Timer".start()
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	game_started = true
	$"fight timer".start()


func _on_enemy_about_to_die():
	KillEnemy = true


func _on_enemy_about_to_not_die():
	KillEnemy = false




func _on_fight_timer_timeout():
	print("timeout")
