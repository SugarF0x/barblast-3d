class_name VictoryLayer
extends CanvasLayer


@onready var retry_button: Button = %RetryButton
@onready var quit_button: Button = %QuitButton
@onready var stars_container: HBoxContainer = %StarsContainer
@onready var breakdown_labels: VBoxContainer = %BreakdownLabels
@onready var base = get_tree().get_first_node_in_group("base")

func victory(survived: bool, at_max_health: bool, plenty_of_gold: bool) -> void:
	visible = true
	
	var stars = stars_container.get_children()
	set_condition(survived, stars[0], "Survived +1")
	set_condition(at_max_health, stars[1], "Full health +1")
	set_condition(plenty_of_gold, stars[2], "Over 300 gold +1")

func set_condition(value: bool, star: TextureRect, text: String) -> void:
	if not value: 
		star.modulate = Color.BLACK
		return
	
	star.modulate = Color.WHITE
	var breakdown_label = Label.new()
	breakdown_labels.add_child(breakdown_label)
	breakdown_label.text = text

func retry() -> void: get_tree().reload_current_scene()

func exit() -> void: get_tree().quit()


func _on_retry_button_pressed() -> void: retry()

func _on_quit_button_pressed() -> void: exit()
