extends KinematicBody2D

var _gravity = 0
var _movement = Vector2()

func shoot(directional_force, gravity):
	_movement = directional_force
	_gravity = gravity
	set_fixed_process(true)

func _fixed_process(delta):
	_movement.y += delta * _gravity
	move(_movement)