extends Node2D

const ENEMY_CLASS = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
    var enemy = ENEMY_CLASS.instantiate()
    enemy.position = position
    get_parent().add_child(enemy)