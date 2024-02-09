extends MarginContainer


@export var starting_gold := 150


@onready var gold_counter: Label = $GoldCounter


var gold: int:
	set(new_gold):
		gold = max(new_gold, 0)
		sync_label()


func _ready() -> void:
	gold = starting_gold


func sync_label(): gold_counter.text = "Gold: " + str(gold)
