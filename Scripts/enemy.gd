extends CharacterBody2D

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
	var random_direction = randf_range(0, 6.283185)
	rotation = random_direction # 6.283185 radians is 360 degrees
	print(random_direction)
