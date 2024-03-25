extends Node2D

signal reset_2

@onready var dialogue = $dialogue
@onready var animplay = $AnimationPlayer
@onready var colorrect = $ColorRect
@onready var audioplay : Array = [$audio_good,$audio_bad]
@onready var animated = $Sprite2D
var scene_factor : Array = [1,2,3,4]
var button1_scene
var button2_scene
var audio_index : int
var animation1
var animation2

func _ready():
	var random_number = scene_factor.pick_random()
	if random_number < 3:
		good_path()
	else:
		bad_path()
	dialogue.initial_text = "Meu amor, por favor, nao me deixe aqui fora, estou com medo"

func good_path():
	audio_index = 0
	animation1 = "button2_pressed"
	animation2 = "button1_pressed"
	button1_scene = preload("res://game_over.tscn")
	button2_scene = "good"
	dialogue.ntext1 = "Filhinho, sei que voce nao gosta de ser incomodado, mas preciso falar com voce"
	dialogue.ntext2 = "Estou preocupada com voce. Por favor, me deixe entrar para ter certeza de que esta tudo bem"
	dialogue.ntext3 = "Amor, sou sua mae. Me deixe entrar, tenho uma surpresa para voce"
	dialogue.ntext4 = "Sei que voce esta ai, preciso te falar de algo importante"
	dialogue.ntext5 = null

func bad_path():
	audio_index = 1
	animation1 = "button1_pressed"
	animation2 = "button2_pressed"
	button1_scene = preload("res://game_over.tscn")
	button2_scene = "good"
	var frame = ["frame1","frame2"]
	animated.play(frame.pick_random())
	dialogue.ntext1 = "Oi filho, vim te visitar, trouxe um pouco de comida"
	dialogue.ntext2 = "Filho me deixe entrar, eles estao vindo, um deles ate me machucou"
	dialogue.ntext3 = "Amor, sou sua mae. Me deixe entrar, tenho uma surpresa para voce"
	dialogue.ntext4 = "Trouxe um presente pra voce, voce vai amar a cabeca de seu cachorro, digo, seu cachorro novo"
	dialogue.ntext5 = null

func _on_button_pressed():
	audioplay[audio_index].stop()
	colorrect.position.y = 0
	animplay.play(animation1)

func _on_button_2_pressed():
	audioplay[audio_index].stop()
	colorrect.position.y = 0
	animplay.play(animation2)

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"button1_pressed":
			var scene1 = button1_scene.instantiate()
			add_child(scene1)
			scene1.reset.connect(reset_game)
		"button2_pressed":
			queue_free()

func _on_dialogue_play_audio():
	audioplay[audio_index].play()

func reset_game():
	reset_2.emit()
	queue_free()
