extends PathFollow3D


@export_range(1.0,10.0) var speed = 5.0


@onready var base = get_tree().get_first_node_in_group("base")


func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0: attack()


func attack():
	base.take_damage(1)
	queue_free()
