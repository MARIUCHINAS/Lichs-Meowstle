extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

var screen_size = Vector2.ZERO

@export var speed = 4

@onready var stats = $Stat

func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	print(screen_size)
	
	
func _enter_tree():
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	if started:
		var velocity = Vector2(speed, 0).rotated((global_rotation)) # Determanes velocity
		move_and_collide(velocity) # Moves and collides using that velocity
		if scared:
			rotate(3.141593) # Rotates 3.141593 Radians or 180 degrees
			scared = false
	

func _on_look_timer_timeout():
	random_direction = randf_range(0, 360)
	rotation_degrees = random_direction # Sets the rotation to a random number
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
