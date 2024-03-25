extends Node2D

@onready var olhar = $Olhar as Button

var packed_scenes = [
	preload("res://policial.tscn")
]

func _on_olhar_pressed():
	var selected_scene = packed_scenes.pick_random().instantiate()
	if selected_scene == null:
		pass 
	add_child(selected_scene)
	#packed_scenes.remove(selected_scene)
