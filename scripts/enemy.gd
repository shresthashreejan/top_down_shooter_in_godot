extends CharacterBody2D

var speed: float = 50.0
var target_pos: Vector2
var max_hp: float = 100.0
var current_hp: float = max_hp

@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
    target_pos = (player.position - position).normalized()
    velocity = target_pos * speed

    if position.distance_to(player.position) > 4:
        move_and_slide()

func calculate_hp(amount: float) -> void:
    current_hp -= amount
    if current_hp <= 0:
        queue_free()