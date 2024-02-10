extends PathFollow3D


@export_range(1.0,10.0) var speed := 5.0
@export var bounty := 15


@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var health_component: HealthComponent = $HealthComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0: attack()


func attack():
	base.take_damage(1)
	queue_free()


func take_damage(value: int):
	animation_player.play("DamageFlash")
	health_component.damage(value)

func die():
	bank.gold += bounty
	queue_free()


func _on_health_component_death() -> void: die()
