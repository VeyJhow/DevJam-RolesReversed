extends Control

@onready var text_rect = $TextureRect
@onready var title = $MarginContainer2/VBoxContainer/Opcoes_titulo
@onready var quit = $MarginContainer2/HBoxContainer/VBoxContainer/Label

func _on_retornar_pressed():
	queue_free()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_cancel") and event.pressed:
			get_tree().quit()
