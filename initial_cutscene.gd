extends Node2D

@onready var dialogue = $dialogue
@onready var audioplay = $AudioStreamPlayer

func _ready():
	dialogue.initial_text = "incontaveis mortes tem sido reportadas nos ultimos dias. Elas sao causadas por criaturas humanoides de origem desconhecida com a capacidade de mudar de forma para parecer com amigos e familiares"
	dialogue.ntext1 = "Elas falham em as vezes ser identicas e sua forma esquisita, mesmo que por pouco e chamada de metamorfo"
	dialogue.ntext2 = "se voce observar uma criatura anormal,mantenha distancia e nos informe imediatamente, tambem e recomendado permanecer em casa e nao deixar ninguem entrar"
	dialogue.ntext3 = "espero que essa transmissao ajude voce nessa situacao e talvez deus te mantenha seguro"
	dialogue.ntext4 = null

func _on_dialogue_get_downed():
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _on_dialogue_play_audio():
	audioplay.play()
