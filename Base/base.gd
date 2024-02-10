class_name Base
extends Node3D


@onready var health_label: Label3D = $HealthLabel
@onready var health_component: HealthComponent = $HealthComponent


func _ready() -> void:
	sync_label()


func sync_label():
	health_label.modulate = Color.RED.lerp(Color.WHITE, float(health_component.health) / health_component.max_health)
	health_label.text = str(health_component.health) + "/" + str(health_component.max_health)

func take_damage(value: int) -> void: 
	health_component.damage(value)
	sync_label()

func get_health_ratio() -> float: return health_component.health / health_component.max_health


func _on_health_component_death() -> void: get_tree().reload_current_scene()
