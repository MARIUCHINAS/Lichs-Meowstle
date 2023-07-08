extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

@export var speed = 4

@onready var stats = $Stat

func _ready():
	randomize()
	
func _enter_tree():
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	if started:
		var velocity = Vector2(speed, 0).rotated((global_rotation))
		move_and_collide(velocity)
		if scared:
			rotate(3.141593)
			scared = false
	

func _on_look_timer_timeout():
	random_direction = randf_range(0, 360)
	rotation_degrees = random_direction
	print(random_direction)

func _on_visible_on_screen_notifier_2d_screen_exited():
	rotate(3.141593) # 3.141593 This is Radians In degrees it would be 180

func _on_visible_on_screen_notifier_2d_screen_entered():
	exited = false

func _on_hud_start_game():
	started = true
	$LookTimer.start()
	
func _on_enter_scare_zone():
	scared = true
