extends Button

var options_scene = preload("res://options_menu.tscn")

func _on_pressed():
	var scene = options_scene.instantiate()
	add_child(scene)
	scene.position = Vector2(-500,324)
	scene.text_rect.hide()
	scene.title.hide()
	scene.quit.show()
