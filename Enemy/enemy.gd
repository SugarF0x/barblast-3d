extends PathFollow3D


@export_range(1.0,10.0) var speed = 5.0


func _process(delta: float) -> void:
	progress += speed * delta
