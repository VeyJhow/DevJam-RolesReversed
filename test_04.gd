extends Sprite2D

var text_index = -1
@onready var label = $Label
var current_text
var ntext1
var ntext2
var ntext3
var ntext4
var ntext5
var ntext6
var ntext7

func _process(_delta):
	label.text = str(current_text)
	if current_text == null:
		queue_free()

func _on_button_pressed():
	var array : Array = [ntext1,ntext2,ntext3,ntext4,ntext5,ntext6,ntext7]
	text_index += 1
	current_text = array[text_index]
