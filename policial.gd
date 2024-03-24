extends Node2D

@onready var dialogue = $dialogue

func _ready():
	dialogue.initial_text = "Senhor, tem sangue na sua porta, saia imediatamente para que eu possa investigar"
