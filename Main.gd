extends Node2D

@onready var olhar = $Olhar as Button


var packed_scenes = [
	preload("res://policial.tscn"),
	preload("res://policial.tscn"),
	preload("res://bombeiro.tscn"),
	preload("res://mae.tscn"),
	preload("res://bombeiro.tscn"),
	preload("res://mae.tscn")
]
var n = packed_scenes.size() -1



func _on_olhar_pressed():
	var array_number = randi_range(0,n)
	var selected_scene = packed_scenes[array_number].instantiate()
	if selected_scene == null:
		pass 
	add_child(selected_scene)
	packed_scenes.remove_at(array_number)
	n -= 1
	
	

