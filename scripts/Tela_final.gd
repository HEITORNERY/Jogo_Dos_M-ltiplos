extends Control

func _ready():
	var Time_and_data = Time.get_datetime_dict_from_system()
	var hora1 = str(Time_and_data.get("hour"))
	var minuto1 = str(Time_and_data.get("minute"))
	var segundo1 = str(Time_and_data.get("second"))
	var dia = str(Time_and_data.get("day"))
	var mes = str(Time_and_data.get("month"))
	var ano = str(Time_and_data.get("year"))
	$MarginContainer/CenterContainer/VBoxContainer/Label3.text = hora1 + ":" + minuto1 + ":" + segundo1
	$MarginContainer/CenterContainer/VBoxContainer/Label5.text = Global.hora+":"+Global.minuto+":"+Global.segundo
	$MarginContainer/CenterContainer/VBoxContainer/Label7.text = dia+"/"+mes+"/"+ano
func _physics_process(delta):
	if Global.erro:
		$MarginContainer/CenterContainer/VBoxContainer/Button.visible = true
		$MarginContainer/CenterContainer/VBoxContainer/Button2.visible = false
	if Global.sucesso:
		$MarginContainer/CenterContainer/VBoxContainer/Button2.visible = true
		$MarginContainer/CenterContainer/VBoxContainer/Button.visible = true
		
func _on_button_tentar_novamente_pressed():
	get_tree().change_scene_to_file("res://scenes/desafio.tscn")

func _on_button_voltar_pro_mundo_pressed():
	get_tree().change_scene_to_file("res://scenes/plataforma.tscn")
