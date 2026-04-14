extends CharacterBody2D

var speed : float = 50.0
var player_pos : Vector2
var target_pos : Vector2
@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
    player_pos = player.position
    target_pos = (player_pos - position).normalized()
    velocity = target_pos * speed

    if position.distance_to(player_pos) > 4:
        move_and_slide()