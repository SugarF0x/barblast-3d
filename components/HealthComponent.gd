class_name HealthComponent
extends Node


signal death


@export var max_health := 10


var health := max_health


func _ready() -> void:
	health = max_health


func damage(val: int) -> void:
	health = max(health - val, 0)
	if (health == 0): death.emit()
