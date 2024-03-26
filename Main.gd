extends Node2D

@onready var olhar = $Olhar as Button
@onready var audioplay = $AudioStreamPlayer
@onready var animplay = $AnimationPlayer


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

func _ready():
	audioplay.play()

func _on_olhar_pressed():
	l += 1
	if l == 7:
		get_tree().change_scene_to_file("res://final_cutscene.tscn")
	animplay.play("pressed")

func reset_game():
	get_tree().reload_current_scene()

func _on_audio_stream_player_finished():
	audioplay.play()

func play_audio_again():
	audioplay.play()
	animplay.play("idle")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"pressed":
			var array_number = randi_range(0,n)
			var selected_scene = packed_scenes[array_number].instantiate()
			add_child(selected_scene)
			selected_scene.reset_2.connect(reset_game)
			selected_scene.play_again.connect(play_audio_again)
			packed_scenes.remove_at(array_number)
			n -= 1
			audioplay.stop()
