extends Node2D
# criar variáveis para os 60 botões 
@onready var button1 = $Button1
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@onready var button7 = $Button7
@onready var button8 = $Button8
@onready var button9 = $Button9
@onready var button10 = $Button10
@onready var button11 = $Button11
@onready var button12 = $Button12
@onready var button13 = $Button13
@onready var button14 = $Button14
@onready var button15 = $Button15
@onready var button16 = $Button16
@onready var string_do_botão = []
# criar uma lista para os múltiplos
var multiplos = []
# variável pro botão atual
var current_button = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	# gerar um número aleatório entre 2 e 10
	var number_random = randi() % 9 + 2
	# adicionar esse número ao primeiro botão
	button1.text = str(number_random)
	# calcular os múltiplos desse número aleatório
	for i in range(2, 21):
		multiplos.append(number_random*i)
	# começar a preencher os botões a partir do primeiro
	fill_buttons()

func fill_buttons():
	var index = 0
	var current_button = button1
	var buttons_path = [button1]

	while current_button != button16:
		var next_buttons = get_next_buttons(current_button)
		var next_button = next_buttons[randi() % next_buttons.size()]

		next_button.text = str(multiplos[index])
		buttons_path.append(next_button)
		current_button = next_button
		index += 1

func get_next_buttons(button):
	var button_map = {
		button1: [button2, button5],
		button2: [button3, button6],
		button3: [button4, button7],
		button4: [button8],
		button5: [button6, button9],
		button6: [button7, button10],
		button7: [button8, button11],
		button8: [button12],
		button9: [button10, button13],
		button10: [button11, button14],
		button11: [button12, button15],
		button12: [button16],
		button13: [button14],
		button14: [button15],
		button15: [button16]
	}
	return button_map.get(button, [])

func _on_button_1_pressed():
	string_do_botão.append($Button1.text)
func _on_button_2_pressed():
	string_do_botão.append($Button2.text)
func _on_button_3_pressed():
	string_do_botão.append($Button3.text)
func _on_button_4_pressed():
	string_do_botão.append($Button4.text)
func _on_button_5_pressed():
	string_do_botão.append($Button5.text)
func _on_button_6_pressed():
	string_do_botão.append($Button6.text)
func _on_button_7_pressed():
	string_do_botão.append($Button7.text)
func _on_button_8_pressed():
	string_do_botão.append($Button8.text)
func _on_button_9_pressed():
	string_do_botão.append($Button9.text)
func _on_button_10_pressed():
	string_do_botão.append($Button10.text)
func _on_button_11_pressed():
	string_do_botão.append($Button11.text)
func _on_button_12_pressed():
	string_do_botão.append($Button12.text)
func _on_button_13_pressed():
	string_do_botão.append($Button13.text)
func _on_button_14_pressed():
	string_do_botão.append($Button14.text)
func _on_button_15_pressed():
	string_do_botão.append($Button15.text)
func _on_button_16_pressed():
	string_do_botão.append($Button16.text)
	$Timer.start()
	Global.sucesso = true
	Global.erro = false
func  _physics_process(_delta):
	if Input.is_action_just_pressed("left_click") and string_do_botão.pop_front() == "": 
		print(string_do_botão)
		$Player.queue_free()
		Global.erro = true
		Global.sucesso = false
		get_tree().change_scene_to_file("res://scenes/Tela_final.tscn")
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Tela_final.tscn")
