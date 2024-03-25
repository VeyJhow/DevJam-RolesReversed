extends Node2D

@onready var dialogue = $dialogue
@onready var audioplay = $AudioStreamPlayer

func _ready():
	dialogue.initial_text = "Nem tudo e o que parece, o pesadelo terminou, mas a memoria permanece"
	dialogue.ntext1 = "As feridas cicatrizam, a jornada chega ao fim, mas voce esta perparado para enfrentar o que vem depois?"
	dialogue.ntext2 = "A escuridao prevalece, mas a esperanca resplandece"
	dialogue.ntext3 = "Resta apenas uma ultima pergunta... O mal realmente foi derrotado?"
	dialogue.ntext4 = null

func _on_dialogue_get_downed():
	pass # Replace with function body.

func _on_dialogue_play_audio():
	audioplay.play()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_cancel") and event.pressed:
			get_tree().quit()
