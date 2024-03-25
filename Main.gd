extends Node2D

@onready var olhar = $Olhar as Button


var packed_scenes = [
	preload("res://policial.tscn"),
	preload("res://policial.tscn"),
	preload("res://bombeiro.tscn"),
	preload("res://mae.tscn"),
	preload("res://bombeiro.tscn"),
	preload("res://mae.tscn"),
	preload("res://mae.tscn"),
	preload("res://bombeiro.tscn"),
	preload("res://policial.tscn")
]
var n = packed_scenes.size() -1
var l = 0



func _on_olhar_pressed():
	l += 1
	if l == 7:
		get_tree().change_scene_to_file("res://final_cutscene.tscn")
	var array_number = randi_range(0,n)
	var selected_scene = packed_scenes[array_number].instantiate()
	add_child(selected_scene)
	selected_scene.reset_2.connect(reset_game)
	packed_scenes.remove_at(array_number)
	n -= 1
	
	

func reset_game():
	get_tree().reload_current_scene()
