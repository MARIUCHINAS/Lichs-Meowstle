extends Node

var game_started = false

@export var ScareZoneScene: PackedScene
@export var BoulderAreaScene: PackedScene
@export var AttackZoneScene: PackedScene
@export var AreaAttack: PackedScene

var screen_size: Vector2

var AttackZoneArea

var KillEnemy = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	
func _enter_tree():
	$Enemy.position = $EnemyStartPositionMarker2D.position

func _input(event):
	if game_started:
		if event is InputEventMouseButton:
			if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
				var mouse_position = get_viewport().get_mouse_position()
				var ScareZoneSpawnLocation = mouse_position
				var ScareZone = ScareZoneScene.instantiate()
				get_tree().get_root().add_child(ScareZone)
				ScareZone.position = ScareZoneSpawnLocation
		
		
		
			if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT):
				var mouse_position = get_viewport().get_mouse_position()
				var curr = AreaAttack.instantiate()
				get_tree().get_root().add_child(curr)
				curr.position = mouse_position
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	game_started = true


func _on_enemy_about_to_die():
	KillEnemy = true


func _on_enemy_about_to_not_die():
	KillEnemy = false
