extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

# speed is sometimes chaged during runtime, so base speed sets the default
var speed

@export var base_speed = 4

@onready var stats = $Stat

func _ready():
	randomize()
	speed = base_speed
func _enter_tree():
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	# multiplies the speed by the amount of panic left, so that it jumps in 
	# speed and then gradualy returns to normal. The + 1 is so that the
	# speed is always at least its regular value, and the division by total
#	wait time makes it so the max speed is always the base speed multiplied 
#	by the panic multiplier
	var panic_multiplier = 3 # speed is multiplied by this durng panic
	speed = base_speed * $PanicCountdown.time_left/$PanicCountdown.wait_time  * panic_multiplier + 1
	
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
	
# run by the scare zone area2d whenever it collides with the player
func _on_enter_scare_zone():
	scared = true
	$PanicCountdown.start()

