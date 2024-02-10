class_name VictoryLayer
extends CanvasLayer


@onready var retry_button: Button = %RetryButton
@onready var quit_button: Button = %QuitButton
@onready var stars_container: HBoxContainer = %StarsContainer
@onready var base = get_tree().get_first_node_in_group("base")

func victory(survived: bool, at_max_health: bool, plenty_of_gold: bool) -> void:
	visible = true
	
	var stars = stars_container.get_children()
	stars[0].modulate = Color.WHITE if survived else Color.BLACK
	stars[1].modulate = Color.WHITE if at_max_health else Color.BLACK
	stars[2].modulate = Color.WHITE if plenty_of_gold else Color.BLACK

func retry() -> void: get_tree().reload_current_scene()

func exit() -> void: get_tree().quit()


func _on_retry_button_pressed() -> void: retry()

func _on_quit_button_pressed() -> void: exit()
