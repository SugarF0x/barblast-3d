class_name DifficultyManager
extends Node


@export var game_length := 30
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve


@onready var level_duration_timer: Timer = %LevelDurationTimer


func _ready() -> void:
	level_duration_timer.start(game_length)


func game_progress_ratio() -> float: return 1.0 - level_duration_timer.time_left / game_length

func get_spawn_time() -> float: return spawn_time_curve.sample(game_progress_ratio())

func get_enemy_difficulty() -> float: return enemy_health_curve.sample(game_progress_ratio())
