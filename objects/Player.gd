extends KinematicBody2D

onready var gun_pivot = $GunPivot
onready var gun_muzzle = $GunPivot/GunMuzzle

var packedBullet = preload("res://objects/Bullet.tscn")


func _physics_process(delta):
	var target_pos = get_global_mouse_position()
	var angle = gun_pivot.get_angle_to(target_pos)
	gun_pivot.rotate(angle)
	
	if Input.is_action_just_pressed("shoot"):
		shoot_multiple_bullets()

func shoot_bullet(angleInDegrees):
	var angleInRadians = deg2rad(angleInDegrees)
	var bullet = packedBullet.instance()
	bullet.global_position = gun_muzzle.global_position
	bullet.rotation = gun_pivot.rotation + angleInRadians;
	get_parent().add_child(bullet)
	
func shoot_multiple_bullets():
	shoot_bullet(15)
	shoot_bullet(0)
	shoot_bullet(-15)
