extends Node3D


@export var projectile_scene: PackedScene


@onready var barrel: MeshInstance3D = %Barrel


func fire():
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.global_position = barrel.global_position


func _on_fire_rate_timer_timeout() -> void: fire()
