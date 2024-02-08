extends Node3D


@export var turret_scene: PackedScene


func _ready() -> void:
	var turret = turret_scene.instantiate()
	add_child(turret)
