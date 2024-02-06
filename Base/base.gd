extends Node3D


@onready var health_label: Label3D = $HealthLabel


@export var max_health: int = 10


var health: int


func _ready():
	health = max_health
	sync_health_label()


func sync_health_label():
	health_label.text = str(health)

func take_damage(value: int) -> void:
	health -= value
	sync_health_label()
