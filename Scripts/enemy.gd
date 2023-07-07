extends CharacterBody2D

var random_direction

var exited = false

@export var speed = 10

func _ready():
	randomize()
	
func _enter_tree():
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	var velocity = Vector2(speed, 0).rotated((global_rotation))
	move_and_collide(velocity)


func _on_look_timer_timeout():
	random_direction = randf_range(0, 360)
	if exited:
		random_direction = -random_direction
	rotation_degrees = random_direction
	print(random_direction)


func _on_visible_on_screen_notifier_2d_screen_exited():
	exited = true


func _on_visible_on_screen_notifier_2d_screen_entered():
	exited = false
