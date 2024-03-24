extends Control

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
		pass

func _on_button_pressed():
	var text_array : Array = [ntext1,ntext2,ntext3,ntext4,ntext5,ntext6,ntext7,ntext8]
	text_index += 1
	initial_text = text_array[text_index]
