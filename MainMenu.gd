class_name MainMenu
extends Control

@onready var jogar = $MarginContainer/MarginContainer2/HBoxContainer/VBoxContainer/Jogar as Button
@onready var opcoes = $MarginContainer/MarginContainer2/HBoxContainer/VBoxContainer/Opcoes as Button
@onready var sair = $MarginContainer/MarginContainer2/HBoxContainer/VBoxContainer/Sair as Button
@onready var start_level
@onready var audioplay = $AudioStreamPlayer
@onready var animplay = $AnimationPlayer
@onready var colorrect = $ColorRect

var options_scene = preload("res://options_menu.tscn")


func _ready():
	jogar.button_down.connect(on_jogar_pressed)
	sair.button_down.connect(_on_sair_pressed)
	opcoes.button_down.connect(_on_opções_pressed)
	audioplay.play()

func on_jogar_pressed() -> void:
	colorrect.position.y = 0
	animplay.play("play_game")

func _on_opções_pressed():
	var options = options_scene.instantiate()
	add_child(options)

func _on_sair_pressed():
	get_tree().quit()

func _on_audio_stream_player_finished():
	audioplay.play()

func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://initial_cutscene.tscn")
