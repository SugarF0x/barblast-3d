extends Node3D


@export var projectile_scene: PackedScene


@onready var barrel: MeshInstance3D = %Barrel


var enemy_path: Path3D


func _physics_process(delta: float) -> void:
	look_at(enemy_path.get_children().back().global_position, Vector3.UP, true)


func fire():
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.global_position = barrel.global_position
	projectile.direction = global_transform.basis.z


func _on_fire_rate_timer_timeout() -> void: fire()
