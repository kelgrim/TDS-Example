extends Area2D

var speed = 250

var bullet_direction = Vector2(1,0)

func _physics_process(delta):
	position += bullet_direction.rotated(rotation) * speed * delta
