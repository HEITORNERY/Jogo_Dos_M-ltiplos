extends Button

func _physics_process(delta):
	if Global.moedas != 0:
		$".".visible = true
	else:
		$".".visible = false

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/desafio.tscn")
