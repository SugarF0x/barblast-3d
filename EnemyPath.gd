extends Path3D


@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultyManager


@onready var enemy_spawn_timer: Timer = %EnemySpawnTimer


func _ready() -> void:
	set_timer()
	Engine.time_scale = 5


func spawn_enemy() -> void: 
	var enemy: Enemy = enemy_scene.instantiate()
	add_child(enemy)
	
	enemy.tree_exited.connect(_on_enemy_defeated)
	
	var difficulty = difficulty_manager.get_enemy_difficulty()
	var health = enemy.max_health + int(2 * difficulty)
	var bounty = enemy.bounty + int(enemy.bounty * difficulty)
	var speed = enemy.speed + enemy.speed * difficulty * .5
	
	enemy._setup(health, bounty, speed)

func set_timer() -> void: enemy_spawn_timer.start(difficulty_manager.get_spawn_time())


func _on_enemy_spawn_timer_timeout() -> void: 
	spawn_enemy()
	if difficulty_manager.get_enemy_difficulty() < 1: set_timer()

func _on_enemy_defeated() -> void:
	if not enemy_spawn_timer.is_stopped(): return
	
	if get_children().all(func(child): return not child is PathFollow3D): print("you have won!")
