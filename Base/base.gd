extends Node3D


@export var max_health: int = 10


var health: int


func _ready():
	health = max_health


func take_damage(value: int) -> void:
	health -= value
	print(health)
