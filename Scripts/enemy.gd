extends CharacterBody2D

var random_direction

var exited = false

var started = false

var scared = false

signal AboutToDie
signal AboutToNotDie

# speed is sometimes chaged during runtime, so base speed sets the default
var speed
var targetpos=Vector2(0,0)
var collision

@export var base_speed = 3

@onready var stats = $Stat

func _ready():
	$cat.play()
	randomize()
	speed = base_speed
	randomdir()
	updatevel()
	

	
func _physics_process(delta):
	# Check for scare zones and run away from them
	for i in get_tree().get_root().get_children():
			if i.name == "ScareZone":
				#var telepos=i.position
				#velocity=(position-telepos)
				#velocity = velocity.normalized() * speed
				var vec =position-i.position
				targetpos=i.position+vec*10000
				
	
	if out_of_bound():
		randomdir()
		
	if abs(position.length()-targetpos.length())<10:
		randomdir()
		
	updatevel()
	if collision:
		velocity.slide(collision.get_normal())
		velocity=velocity.normalized()*speed
		print("sliding")
	print(velocity)
	collision = move_and_collide(velocity)

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
	var w=ProjectSettings.get_setting("display/window/size/viewport_width")
	var h=ProjectSettings.get_setting("display/window/size/viewport_height")
	targetpos=Vector2(randf_range(w*.1,w*.9),randf_range(h*.1,h*.9))#range of posible target positions

func updatevel():
	velocity=(targetpos-position)
	velocity=velocity.normalized()*speed

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
