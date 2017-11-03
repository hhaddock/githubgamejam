extends Node

func _ready():
	set_process(true)

func _process(delta):
	if(Input.is_action_pressed("Game_Start")):
		get_tree().change_scene("res://Scenes/Levels/LevelSelect.tscn")

func _on_Button_pressed():
	print("Start Game")
	get_tree().change_scene("res://Scenes/Game.tscn")
