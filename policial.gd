extends Node2D

<<<<<<< Updated upstream
=======
signal reset_2
signal play_again

>>>>>>> Stashed changes
@onready var dialogue = $dialogue
@onready var animplay = $AnimationPlayer
@onready var colorrect = $ColorRect
@onready var audioplay : Array = [$audio_good,$audio_bad]
@onready var audio_play_door = $AudioStreamPlayer
@onready var audio_play_door2 = $AudioStreamPlayer2
@onready var animated = $Sprite2D
var scene_factor : Array = [1,2,3,4]
var button1_scene
var button2_scene
var audio_index : int

func _ready():
	var random_numer = scene_factor.pick_random()
	if random_numer < 3:
		good_path()
	else:
		bad_path()
	dialogue.initial_text = "Senhor, tem sangue na sua porta, saia imediatamente para que eu possa investigar"

func good_path():
	audio_index = 0
	button1_scene = "good"
	button2_scene = "res://game_over.tscn"
	dialogue.ntext1 = "Eu sou o oficial de policia local e recebi um chamado de emergencia de um vizinho"
	dialogue.ntext2 = "Eu devo garantir a seguranca de todos no local, deixe me entrar"
	dialogue.ntext3 = "Recebemos denuncias no local, preciso garantir a sua seguranca"
	dialogue.ntext4 = "Precisamos fazer uma inspecao de rotina em todas as residencias, deixe me entrar agora"
	dialogue.ntext5 = "Deixe me entrar, farei apenas algumas perguntas"
	dialogue.ntext6 = "Senhor,temos um mandato de busca precisamos entrar agora"
	dialogue.ntext7 = null

func bad_path():
	audio_index = 1
	button1_scene = "res://game_over.tscn"
	button2_scene = "good"
	var frame = ["frame1","frame2"]
	animated.play(frame.pick_random())
	dialogue.ntext1 = "Senhor, precisamos ter certeza de que todos sejam devorados"
	dialogue.ntext2 = "Eu devo garantir a seguranca de todos no local, deixe me entrar"
	dialogue.ntext3 = "Com licenca,temos um mandato de busca e devoracao, pode por favor abrir a porta"
	dialogue.ntext4 = "Precisamos fazer uma inspecao de rotina em todas as residencias, deixe me entrar agora"
	dialogue.ntext5 = "Deixe me entrar, farei apenas algumas perguntas"
	dialogue.ntext7 = "Criatura insolente, abra ou morra"
	dialogue.ntext8 = null

func _on_button_pressed():
	audioplay[audio_index].stop()
	colorrect.position.y = 0
<<<<<<< Updated upstream
	animplay.play("button1_pressed")
=======
	animplay.play(animation1)
	audio_play_door.play()
>>>>>>> Stashed changes

func _on_button_2_pressed():
	audioplay[audio_index].stop()
	colorrect.position.y = 0
	animplay.play("button2_pressed")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"button1_pressed":
			get_tree().change_scene_to_file(button1_scene)
		"button2_pressed":
<<<<<<< Updated upstream
			get_tree().change_scene_to_file(button2_scene)

func _on_dialogue_play_audio():
	audioplay[audio_index].play()
=======
			audio_play_door2.play()

func _on_dialogue_play_audio():
	audioplay[audio_index].play()

func reset_game():
	reset_2.emit()
	queue_free()

func _on_audio_stream_player_2_finished():
	queue_free()
	play_again.emit()

func _on_dialogue_get_downed():
	audioplay[audio_index].stop()
>>>>>>> Stashed changes
