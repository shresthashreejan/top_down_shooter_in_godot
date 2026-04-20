extends CharacterBody2D

const BULLET_CLASS = preload("res://scenes/bullet.tscn")

var movement_speed: float = 100.0
var player_direction: Vector2

func _physics_process(delta: float) -> void:
    player_direction.x = Input.get_axis("move_left", "move_right")
    player_direction.y = Input.get_axis("move_up", "move_down")
    player_direction = player_direction.normalized()

    if player_direction:
        velocity = player_direction * movement_speed
    else:
        velocity = Vector2.ZERO

    look_at(get_global_mouse_position())

    move_and_slide()

func shoot() -> void:
    var bullet = BULLET_CLASS.instantiate()
    bullet.init(%Gun)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("shoot"):
        shoot()