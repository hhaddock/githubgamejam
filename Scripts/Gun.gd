extends Position2D

export (PackedScene) var bullet_scene
export (NodePath) var bullet_spawn_path
onready var bullet_spawn = get_node(bullet_spawn_path)

func _ready():
	pass
	

func shoot():
	var bullet = bullet_scene.instance()
	bullet.set_global_pos(bullet_spawn.get_global_pos())
	
	get_parent().add_child(bullet)