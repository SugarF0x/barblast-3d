extends Camera3D


@export var grid_map: GridMap
@export var turret_manager: Node3D
@export var turret_cost := 100


@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var bank = get_tree().get_first_node_in_group("bank")


func _process(delta: float) -> void:
	ray_cast_3d.target_position = project_local_ray_normal(get_viewport().get_mouse_position()) * 100.0
	ray_cast_3d.force_raycast_update()
	
	if not ray_cast_3d.is_colliding(): return reset_pointer()
	var collider = ray_cast_3d.get_collider()
	
	if not collider is GridMap: return reset_pointer()
	
	var collision_point = ray_cast_3d.get_collision_point()
	var cell = grid_map.local_to_map(collision_point)
	
	if grid_map.get_cell_item(cell) == 0:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		if Input.is_action_just_pressed("click"): build_turret(cell)
	else: reset_pointer()


func build_turret(cell: Vector3) -> void:
	if bank.gold < turret_cost: return
	
	bank.gold -= turret_cost
	grid_map.set_cell_item(cell, 1)
	turret_manager.build_turret(grid_map.map_to_local(cell))

func reset_pointer() -> void: Input.set_default_cursor_shape(Input.CURSOR_ARROW)
