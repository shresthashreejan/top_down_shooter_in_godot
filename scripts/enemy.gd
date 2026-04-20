extends CharacterBody2D

var speed: float = 50.0
var player_pos: Vector2
var target_pos: Vector2
var max_hp: float = 100.0
var current_hp: float = max_hp

@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
    player_pos = player.position
    target_pos = (player_pos - position).normalized()
    velocity = target_pos * speed

    if position.distance_to(player_pos) > 4:
        move_and_slide()

func add_hp(amount: float) -> void:
    current_hp += amount
    if current_hp <= 0:
        queue_free()