extends Node2D


@onready var animplay = $AnimationPlayer
@onready  var button = $Button

func _ready():
	animplay.play("game_over")

func _on_button_pressed():
	animplay.play("button_pressed")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"game_over":
			button.show()
		"button_pressed":
			button.hide()
			queue_free()
