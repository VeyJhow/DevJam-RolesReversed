extends Node2D

var packed_scene = [
	#coloca aqui as cenas que podem ser carregadas
]

func _scene_randomizer():
	var selected_scene = packed_scene.pick_random()
	if selected_scene == null:
		pass 
	get_tree().change_scene_to_file(selected_scene)
	packed_scene.remove(selected_scene)
	
