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
	var random_number = scene_factor.pick_random()
	if random_number < 3:
		good_path()
	else:
		bad_path()
	dialogue.initial_text = "Bom noite, senhor sou do corpo de bombeiros local. Desculpe incomoda lo"

func good_path():
	audio_index = 0
	button1_scene = "good"
	button2_scene = "res://game_over.tscn"
	dialogue.ntext1 = "Ha relatos de vazamento de gas na area precisamos verificar sua residencia"
	dialogue.ntext2 = "Abra a porta, houve um incendio no predio ao lado, preciso garantir sua seguranca"
	dialogue.ntext3 = "Preciso entrar imediantamente em sua casa por motivos de seguranca"
	dialogue.ntext4 = "Senhor, isso e uma emergencia, precisamos evacuar a todos imediatamente"
	dialogue.ntext5 = null

func bad_path():
	audio_index = 1
	button1_scene = "res://game_over.tscn"
	button2_scene = "good"
	var frame = ["frame1","frame2"]
	animated.play(frame.pick_random())
	dialogue.ntext1 = "Estamos evacuando esta area devido a um vazamento de gas... e tambem porque estou faminto"
	dialogue.ntext2 = "Temos informacoes sobre um possivel perigo iminente... para voce, claro. Abra a porta para que possamos discutir isso."
	dialogue.ntext3 = "Preciso entrar imediantamente em sua casa por motivos de seguranca"
	dialogue.ntext4 = "Nao se preocupe, voce nao vai precisar de muito oxigenio"
	dialogue.ntext5 = null

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
