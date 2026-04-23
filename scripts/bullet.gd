extends Area2D

var speed: float = 500.0
var damage: float = 100.0
var direction: Vector2

func init(parent: Node2D) -> void:
    global_position = parent.global_position
    global_rotation = parent.global_rotation
    direction = Vector2.RIGHT.rotated(rotation)
    parent.add_child(self)

func _physics_process(delta: float) -> void:
    position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
    if body.has_method("calculate_hp"):
        body.calculate_hp(damage)
        Global.score += 1
        queue_free()
