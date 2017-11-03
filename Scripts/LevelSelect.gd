extends Node

var Levels = ["Game","Link","Pac","Galaga"]
var i = 0
var currentLevel = Levels[i]
var worldText

func _ready():
	worldText = get_node("Control/worldName")
	worldText.set_text(currentLevel)
	set_process_input(true)

func _input(event):
	if(Input.is_action_pressed("d-right") && i < 3):
		i += 1
		currentLevel = Levels[i]
		worldText.set_text(currentLevel)
	elif(Input.is_action_pressed("d-left") && i > 0):
		i -= 1
		currentLevel = Levels[i]
		worldText.set_text(currentLevel)
	elif(Input.is_action_pressed("ui_up")):
		get_node("/root/global").set_level(currentLevel)
