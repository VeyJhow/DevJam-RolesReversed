extends Node2D

var packed_scene = [
	#coloca aqui as cenas que podem ser carregadas
]

func _scene_randomizer():
	randomize()
	#randomiza uma cena do vetor de cenas
	var x = randi_range(0, packed_scene.size())
	var scene = packed_scene[x].instance()
	get_tree().change_scene_to_file(x)
