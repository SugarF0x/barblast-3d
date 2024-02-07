extends Camera3D


@onready var ray_cast_3d: RayCast3D = $RayCast3D


func _process(delta: float) -> void:
	ray_cast_3d.target_position = project_local_ray_normal(get_viewport().get_mouse_position()) * 100.0
	ray_cast_3d.force_raycast_update()
	print(ray_cast_3d.get_collider())
