extends Node2D

@onready var window = $window

func _ready():
	window.current_text = "tudo bom sou o come cu"
	window.ntext1 = "deixa eu entra"
	window.ntext2 = "prometo nao come teu cu"
	window.ntext3 = null

func _on_button_pressed():
	get_tree().change_scene_to_file("res://text_05.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://text_06.tscn")
