extends Node

var game_started = false

@export var ScareZoneScene: PackedScene
@export var BoulderAreaScene: PackedScene
@export var AttackZoneScene: PackedScene

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
				var BoulderSpawnLocation = mouse_position
				var BoulderArea = BoulderAreaScene.instantiate()
				get_tree().get_root().add_child(BoulderArea)
				BoulderArea.position = BoulderSpawnLocation
				$Enemy.position = BoulderArea.position
				emit_signal("BoulderSpawn")
		
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	$AttackZoneCollisionTimer.start()
	$SpawnAttackZoneTimer.start()
	game_started = true


func _on_enemy_about_to_die():
	KillEnemy = true


func _on_enemy_about_to_not_die():
	KillEnemy = false


func _on_spawn_attack_zone_timer_timeout():
	var AttackZoneSpawnLocation = Vector2(screen_size / 2)
	AttackZoneArea = AttackZoneScene.instantiate()
	get_tree().get_root().add_child(AttackZoneArea)
	AttackZoneArea.position = AttackZoneSpawnLocation
	emit_signal("BoulderSpawn")


func _on_attack_zone_collision_timer_timeout():
	if KillEnemy:
		$Enemy.queue_free()
	else:
		print("Congratz")
		for i in get_tree().get_root().get_children():
			if i.name == "AreaAttackLineMiddle":
				i.queue_free()
