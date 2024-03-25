extends Node2D

@onready var dialogue = $dialogue
@onready var animplay = $AnimationPlayer
@onready var colorrect = $ColorRect
@onready var audioplay : Array = [$audio_good,$audio_bad]
@onready var animated = $Sprite2D
var scene_factor : Array = [1,2,3,4]
var button1_scene
var button2_scene
var audio_index : int

func _ready():
	var random_number = scene_factor.pick_random()
	if random_number < 3:
		good_path()
	else:
		bad_path()
	dialogue.initial_text = "Meu amor, por favor, nao me deixe aqui fora, estou com medo"

func good_path():
	audio_index = 0
	button1_scene = "good"
	button2_scene = "res://game_over.tscn"
	dialogue.ntext1 = "Filhinho, sei que voce nao gosta de ser incomodado, mas preciso falar com voce"
	dialogue.ntext2 = "Estou preocupada com voce. Por favor, me deixe entrar para ter certeza de que esta tudo bem"
	dialogue.ntext3 = "Amor, sou sua mae. Me deixe entrar, tenho uma surpresa para voce"
	dialogue.ntext4 = "Sei que voce esta ai, preciso te falar de algo importante"
	dialogue.ntext5 = null

func bad_path():
	audio_index = 1
	button1_scene = "res://game_over.tscn"
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
	animplay.play("button1_pressed")

func _on_button_2_pressed():
	audioplay[audio_index].stop()
	colorrect.position.y = 0
	animplay.play("button2_pressed")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"button1_pressed":
			get_tree().change_scene_to_file(button1_scene)
		"button2_pressed":
			get_tree().change_scene_to_file(button2_scene)

func _on_dialogue_play_audio():
	audioplay[audio_index].play()
