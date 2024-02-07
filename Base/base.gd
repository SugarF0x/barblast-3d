extends Node3D


@onready var health_label: Label3D = $HealthLabel


@export var max_health: int = 10


var health: int:
	set(val):
		health = val
		health_label.text = str(health)
		if (health <= 0): get_tree().reload_current_scene()


func _ready():
	health = max_health


func take_damage(value: int) -> void:
	health -= value
