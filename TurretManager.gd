extends Node3D


@export var turret_scene: PackedScene


@onready var enemy_path: Path3D = %EnemyPath


func build_turret(pos: Vector3) -> void:
	var turret = turret_scene.instantiate()
	add_child(turret)
	turret.global_position = pos
	turret.enemy_path = enemy_path
