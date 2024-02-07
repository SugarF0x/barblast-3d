extends Camera3D


@export var grid_map: GridMap


@onready var ray_cast_3d: RayCast3D = $RayCast3D


func _process(delta: float) -> void:
	ray_cast_3d.target_position = project_local_ray_normal(get_viewport().get_mouse_position()) * 100.0
	ray_cast_3d.force_raycast_update()
	
	if not ray_cast_3d.is_colliding(): return
	var collider = ray_cast_3d.get_collider()
	
	if collider is GridMap:
		var collision_point = ray_cast_3d.get_collision_point()
		var cell = grid_map.local_to_map(collision_point)
		if Input.is_action_just_pressed("click") and grid_map.get_cell_item(cell) == 0: grid_map.set_cell_item(cell, 1)
