extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

signal AboutToDie
signal AboutToNotDie

# speed is sometimes chaged during runtime, so base speed sets the default
var speed

@export var base_speed = 3

@onready var stats = $Stat

func _ready():
	$cat.play()
	randomize()
	speed = base_speed
	randomdir()
	
func _enter_tree():
	pass

	
func _physics_process(delta):
	# Check for scare zones and run away from them
	if out_of_bound():
		randomdir()
	for i in get_tree().get_root().get_children():
			if i.name == "ScareZone":
				var telepos=i.position
				velocity=(position-telepos)
				velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity)
	if collision:
		velocity*=-1
	#move_and_slide()
	#print(collision)

func Indanger(InDanger):
	if InDanger:
		emit_signal("AboutToDie")
	else:
		emit_signal("AboutToNotDie")
		

func _on_look_timer_timeout():
	randomdir()
	
func out_of_bound():
	var w=ProjectSettings.get_setting("display/window/size/viewport_width")
	var h=ProjectSettings.get_setting("display/window/size/viewport_height")
	if position.y>h*.9 or position.y<h*.1:
		return true
	elif position.x>w*.9 or position.x<w*.1:
		return true
	else: return false
	
func randomdir():
	var target=Vector2(randf_range(100,1200),randf_range(100,600))#range of posible target positions
	velocity=(target-position)
	velocity=velocity.normalized()*speed
	#print(velocity)

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Enemy out of bounds")

func _on_visible_on_screen_notifier_2d_screen_entered():
	print("Entered")

func _on_hud_start_game():
	started = true
	$LookTimer.start()
	$RehealTimer.start()
	
# run by the scare zone area2d whenever it collides with the player



func _on_reheal_timer_timeout():
	
	if get_tree().get_root().get_node("Main").health >= 100:
		print("baba")
	else:
		get_tree().get_root().get_node("Main").health += 1
		
	get_tree().get_root().get_node("Main").health
