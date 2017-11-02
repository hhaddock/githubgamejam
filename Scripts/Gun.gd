extends KinematicBody2D

export (PackedScene) var bullet_scene
export (NodePath) var bullet_spawn_path
onready var bullet_spawn = get_node(bullet_spawn_path)

export (int) var bullet_gravity = 5
export (int) var bullet_speed = 8
export (float) var bullet_angle = 0 setget set_bullet_angle
var directional_force = Vector2()

var shooting = false
export (float) var bullet_delay = 1
var waited = 0

func _ready():
	update_directional_force()
	set_process_input(true)
	set_process(true)

func _input(event):
	if(event.is_action_pressed("shoot")):
		shooting = true
	elif(event.is_action_released(("shoot"))):
		shooting = false

func _process(delta):
	check_bullet_direction()
	if(shooting && waited > bullet_delay):
		fire_once()
		waited = 0
	elif(waited <= bullet_delay):
		waited += delta

func fire_once():
	shoot()
	shooting = false

func shoot():
	var bullet = bullet_scene.instance()
	bullet.set_global_pos(bullet_spawn.get_global_pos())
	bullet.shoot(directional_force, bullet_gravity)
	get_tree().get_root().add_child(bullet)

func set_bullet_angle(value):
	bullet_angle = clamp(value, 0, 359)

func update_directional_force():
	directional_force = Vector2(cos(bullet_angle*(PI/180)), sin(bullet_angle*(PI/180))) * bullet_speed

func check_bullet_direction():
	if(get_node("/root/global").get_facing_left() == true):
		directional_force = Vector2(cos((bullet_angle - 180)*(PI/180)), sin(bullet_angle*(PI/180))) * bullet_speed
	else:
		update_directional_force();