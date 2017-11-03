extends KinematicBody2D

var GRAVITY = Vector2(0, 500)

#Movement Constants
const FLOOR_NORMAL = Vector2(0,-1)
const SLOPE_FRICTION = 20
const MOVE_SPEED = 300
const ACCELERATION = 0.3
const JUMPFORCE = 400
const JUMPTIMETHRESHOLD = 0.2

var velocity = Vector2()

var canJump = false
var jumpTimer = 0

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	playerMovement(delta)

func playerMovement(delta):
	velocity += GRAVITY * delta
	jumpTimer += delta
	
	velocity = move_and_slide(velocity, FLOOR_NORMAL, SLOPE_FRICTION)
	canJump = is_move_and_slide_on_floor()
	
	if(is_move_and_slide_on_floor()):
		jumpTimer = 0
	
	canJump = jumpTimer < JUMPTIMETHRESHOLD
	
	var movement = 0
	if(Input.is_action_pressed("ui_left")):
		movement -= 1
		get_node("/root/global").set_facing_left(true)
		set_scale(Vector2(-1,1))
	if(Input.is_action_pressed("ui_right")):
		movement += 1
		get_node("/root/global").set_facing_left(false)
		set_scale(Vector2(1,1))
	movement *= MOVE_SPEED
	velocity.x = lerp(velocity.x, movement, ACCELERATION)
	
	if(canJump && Input.is_action_pressed("ui_up")):
		velocity.y -= JUMPFORCE
		jumpTimer = JUMPTIMETHRESHOLD