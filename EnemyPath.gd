extends Path3D


@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultyManager


@onready var enemy_spawn_timer: Timer = %EnemySpawnTimer


func _ready() -> void:
	set_timer()


func spawn_enemy() -> void: add_child(enemy_scene.instantiate())

func set_timer() -> void: enemy_spawn_timer.start(difficulty_manager.get_spawn_time())


func _on_enemy_spawn_timer_timeout() -> void: 
	spawn_enemy()
	set_timer()
