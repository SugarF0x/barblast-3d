extends Path3D


@export var enemy_scene: PackedScene


func spawn_enemy() -> void: add_child(enemy_scene.instantiate())


func _on_enemy_spawn_timer_timeout() -> void: spawn_enemy()
