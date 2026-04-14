extends Node2D

@onready var enemy_scene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
    var enemy = enemy_scene.instantiate()
    enemy.position = position
    get_parent().add_child(enemy)