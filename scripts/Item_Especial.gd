extends Button

func _physics_process(delta):
	if Global.moedas != 0:
		$".".visible = true
	else:
		$".".visible = false

func _on_pressed():
	var Time_and_data = Time.get_datetime_dict_from_system()
	var hora1 = str(Time_and_data.get("hour"))
	var minuto1 = str(Time_and_data.get("minute"))
	var segundo1 = str(Time_and_data.get("second"))
	Global.hora = hora1
	Global.segundo = segundo1
	Global.minuto = minuto1
	Global.moedas -= 1
	get_tree().change_scene_to_file("res://scenes/desafio.tscn")
	
