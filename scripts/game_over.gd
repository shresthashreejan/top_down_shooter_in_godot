extends Control

func restart() -> void:
	get_tree().reload_current_scene()

func quit() -> void:
	get_tree().quit()

func trigger() -> void:
	get_tree().paused = true
	show()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	hide()
	Global.score = 0
	restart()

func _on_quit_pressed() -> void:
	quit()

func _ready() -> void:
	hide()