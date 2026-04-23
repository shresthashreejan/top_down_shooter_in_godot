extends CharacterBody2D

@onready var game_over = get_tree().current_scene.get_node("CanvasLayer/GameOver")

var speed: float = 50.0
var target_pos: Vector2
var max_hp: float = 100.0
var current_hp: float = max_hp

@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
    target_pos = (player.position - position).normalized()
    velocity = target_pos * speed

    move_and_slide()

    for i in get_slide_collision_count():
        var collision = get_slide_collision(i)
        if collision.get_collider().name == "Player":
            trigger_game_over()

func calculate_hp(amount: float) -> void:
    current_hp -= amount
    if current_hp <= 0:
        queue_free()

func trigger_game_over():
    game_over.trigger()