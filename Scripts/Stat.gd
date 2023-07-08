extends Node

signal no_health

@export var max_health = 10
@onready var current_health = max_health:
	get:
		return current_health
	set(value):
		current_health = value
		if current_health <= 0:
			emit_signal("no_health")



@export var max_excitement = 10
@onready var current_excitement = max_excitement
