extends Control

func resume() -> void:
	get_tree().paused = false
	hide()

func pause() -> void:
	get_tree().paused = true
	show()

func restart() -> void:
	get_tree().reload_current_scene()

func quit() -> void:
	get_tree().quit()

func trigger_pause() -> void:
	if Input.is_action_just_pressed("escape"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	restart()

func _on_quit_pressed() -> void:
	quit()

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	trigger_pause()