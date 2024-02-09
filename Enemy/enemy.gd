extends PathFollow3D


@export_range(1.0,10.0) var speed := 5.0


@onready var base = get_tree().get_first_node_in_group("base")
@onready var health_component: HealthComponent = $HealthComponent


func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0: attack()


func attack():
	base.take_damage(1)
	queue_free()


func take_damage(value: int): health_component.damage(value)

func _on_health_component_death() -> void: queue_free()
