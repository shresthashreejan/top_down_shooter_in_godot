extends Node2D

const ENEMY_CLASS = preload("res://scenes/enemy.tscn")
var spawn_points := []

func _ready() -> void:
    for i in get_children():
        if i is Marker2D:
            spawn_points.append(i)

func _on_timer_timeout() -> void:
    var spawn_point = spawn_points.pick_random()
    var enemy = ENEMY_CLASS.instantiate()
    enemy.position = spawn_point.position
    get_parent().add_child(enemy)