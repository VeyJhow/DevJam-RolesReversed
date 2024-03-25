extends Control

signal play_audio

var text_index = -1
@onready var animated = $AnimatedSprite2D
@onready var label = $Label
@onready var animplay = $AnimationPlayer
var initial_text
var ntext1
var ntext2
var ntext3
var ntext4
var ntext5
var ntext6
var ntext7
var ntext8

func _ready():
	animated.play("default")
	animplay.play("get_up")

func _process(_delta):
	label.text = str(initial_text)
	if initial_text == null:
		label.set_self_modulate("ffffff00")
		animplay.play("get_down")

func _on_button_pressed():
	var text_array : Array = [ntext1,ntext2,ntext3,ntext4,ntext5,ntext6,ntext7,ntext8]
	text_index += 1
	initial_text = text_array[text_index]
	play_audio.emit()

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"get_down":
			queue_free()
		"get_up":
			play_audio.emit()
