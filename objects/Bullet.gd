extends Area2D

var speed = 250

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta
