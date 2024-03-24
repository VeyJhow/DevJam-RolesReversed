class_name MainMenu
extends Control


@onready var jogar = $MarginContainer/HBoxContainer/VBoxContainer/Jogar as Button
@onready var opcoes = $MarginContainer/HBoxContainer/VBoxContainer/Opcoes as Button
@onready var sair = $MarginContainer/HBoxContainer/VBoxContainer/Sair as Button
@onready var start_level




func _ready():
	jogar.button_down.connect(on_jogar_pressed)
	sair.button_down.connect(_on_sair_pressed)
	opcoes.button_down.connect(_on_opções_pressed)

func on_jogar_pressed() -> void:
	pass #Fazer o randomizador de cena 
	# get_tree().change_scene_to_file(cena do jogo)

func _on_opções_pressed():
	get_tree().change_scene_to_file("res://options_menu.tscn")


func _on_sair_pressed():
	get_tree().quit()
