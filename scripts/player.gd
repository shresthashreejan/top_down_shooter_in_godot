extends CharacterBody2D

var movement_speed : float = 100
var player_direction : Vector2

func _physics_process(delta: float) -> void:
    player_direction.x = Input.get_axis("move_left", "move_right")
    player_direction.y = Input.get_axis("move_up", "move_down")
    player_direction = player_direction.normalized()

    if player_direction:
        velocity = player_direction * movement_speed
    else:
        velocity = Vector2.ZERO

    move_and_slide()