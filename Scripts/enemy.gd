extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

signal AboutToDie
signal AboutToNotDie

# speed is sometimes chaged during runtime, so base speed sets the default
var speed

@export var base_speed = 4

@onready var stats = $Stat

func _ready():
	randomize()
	speed = base_speed
func _enter_tree():
	pass

	
func _physics_process(delta):
	print("jjj")
	# multiplies the speed by the amount of panic left, so that it jumps in 
	# speed and then gradualy returns to normal. The + 1 is so that the
	# speed is always at least its regular value, and the division by total
	#	wait time makes it so the max speed is always the base speed multiplied 
	#	by the panic multiplier
	#var panic_multiplier = 3 # speed is multiplied by this durng panic
	#speed = base_speed * $PanicCountdownTimer.time_left/$PanicCountdownTimer.wait_time  * panic_multiplier + 1
	#if started:
#		var velocity = Vector2(speed, 0).rotated((global_rotation)) * delta # Determanes velocity
	#	move_and_collide(velocity) # Moves and collides using that velocity
	#	if scared:
	#		rotate(3.141593) # Rotates 3.141593 Radians or 180 degrees
	#		scared = false
	for i in get_tree().get_root().get_children():
			if i.name == "ScareZone":
				var telepos=i.position
				velocity=(position-telepos)
				velocity=velocity.normalized()*speed
		
	move_and_collide(velocity)

func Indanger(InDanger):
	if InDanger:
		emit_signal("AboutToDie")
	else:
		emit_signal("AboutToNotDie")
		

func _on_look_timer_timeout():
	#random_direction = randf_range(0, 360)
	#rotation_degrees = random_direction # Sets the rotation to a random number
	#print(random_direction)
	var target=Vector2(randf_range(100,1200),randf_range(100,600))#range of posible target positions
	velocity=(target-position)
	velocity=velocity.normalized()*speed

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
	$PanicCountdownTimer.start()

