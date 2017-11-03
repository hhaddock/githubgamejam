extends Node

#Gloabal Level
var level = ""

#Player Direction
var facingLeft = false

func _ready():
	set_process(true)
	pass

func _process(delta):
	if(Input.is_action_pressed("esc")):
		get_tree().quit()

func get_level():
	return level

func set_level(value):
	level = value
	get_tree().change_scene("res://Scenes/"+level+".tscn")

func get_facing_left():
	return facingLeft

func set_facing_left(value):
	facingLeft = value