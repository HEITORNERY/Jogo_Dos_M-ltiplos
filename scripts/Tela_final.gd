extends Control

func _ready():
	var Time_and_data = Time.get_datetime_dict_from_system()
	var hora1 = str(Time_and_data.get("hour"))
	var minuto1 = str(Time_and_data.get("minute"))
	var segundo1 = str(Time_and_data.get("second"))
	$MarginContainer/CenterContainer/VBoxContainer/Label3.text = hora1 + ":" + minuto1 + ":" + segundo1
	$MarginContainer/CenterContainer/VBoxContainer/Label5.text = Global.hora+":"+Global.minuto+":"+Global.segundo
