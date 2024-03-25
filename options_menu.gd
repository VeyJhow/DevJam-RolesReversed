extends Control

@onready var retornar = $MarginContainer2/HBoxContainer/VBoxContainer/Retornar as Button

func _ready():
	retornar.button_down.connect(_on_retornar_pressed)

func _on_retornar_pressed():
	queue_free()
	get_tree().change_scene_to_file("res://main_menu.tscn")
