extends Node3D


@export var projectile_scene: PackedScene


@onready var barrel: MeshInstance3D = %Barrel


var enemy_path: Path3D
var target_position: Vector3


func _physics_process(delta: float) -> void:
	target_position = enemy_path.get_children().back().global_position
	look_at(target_position, Vector3.UP, true)


func fire():
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.global_position = barrel.global_position
	projectile.direction = projectile.global_position.direction_to(target_position)
	projectile.direction.y = 0


func _on_fire_rate_timer_timeout() -> void: fire()
