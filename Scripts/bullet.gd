extends KinematicBody2D

var _gravity = 0
var _movement = Vector2()
var hitbox

func _ready():
	hitbox = get_node("HitBox")
	hitbox.connect("body_enter", self, "_on_Area2D_body_enter")
	hitbox.connect("body_exit", self, "_on_Area2D_body_exit")

func shoot(directional_force, gravity):
	_movement = directional_force
	_gravity = gravity
	set_fixed_process(true)

func _fixed_process(delta):
	_movement.y += delta * _gravity
	move(_movement)

func _on_Area2D_body_enter(body):
	print(body.get_parent().get_name())
	body.get_parent().remove_child(self)