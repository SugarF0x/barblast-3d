extends Node3D


@export var projectile_scene: PackedScene


@onready var barrel: MeshInstance3D = %Barrel


var enemy_path: Path3D
var target: PathFollow3D


func _physics_process(delta: float) -> void:
	find_best_target()
	if not target: return
	
	look_at(target.global_position, Vector3.UP, true)


func fire():
	if not target: return
	
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.global_position = barrel.global_position
	projectile.direction = global_transform.basis.z


func find_best_target() -> void:
	var enemies = enemy_path.get_children().filter(func(child): return child is PathFollow3D)
	target = enemies.reduce(func(acc: PathFollow3D, val: PathFollow3D): return val if acc.progress_ratio < val.progress_ratio else acc)


func _on_fire_rate_timer_timeout() -> void: fire()
