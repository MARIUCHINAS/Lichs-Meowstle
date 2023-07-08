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
	$cat.play()
	randomize()
	speed = base_speed
func _enter_tree():
	pass

	
func _physics_process(delta):
	
	# Check for scare zones and run away from them
	for i in get_tree().get_root().get_children():
			if i.name == "ScareZone":
				var telepos=i.position
				velocity=(position-telepos)
				velocity = velocity.normalized() * speed
	move_and_collide(velocity)

func Indanger(InDanger):
	if InDanger:
		emit_signal("AboutToDie")
	else:
		emit_signal("AboutToNotDie")
		

func _on_look_timer_timeout():
	var target=Vector2(randf_range(100,1200),randf_range(100,600))#range of posible target positions
	velocity=(target-position)
	velocity=velocity.normalized()*speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Enemy out of bounds")

func _on_visible_on_screen_notifier_2d_screen_entered():
	exited = false

func _on_hud_start_game():
	started = true
	$LookTimer.start()
	
# run by the scare zone area2d whenever it collides with the player
func _on_enter_scare_zone():
	scared = true
	$PanicCountdownTimer.start()

