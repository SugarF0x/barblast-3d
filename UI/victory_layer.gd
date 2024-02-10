extends CanvasLayer


@onready var retry_button: Button = %RetryButton
@onready var quit_button: Button = %QuitButton


func retry() -> void: get_tree().reload_current_scene()

func exit() -> void: get_tree().quit()


func _on_retry_button_pressed() -> void: retry()

func _on_quit_button_pressed() -> void: exit()
