extends Node2D

# Criar variáveis para os 16 botões
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

# Criar uma lista para os múltiplos
var multiplos = []

# Variável para armazenar os números não múltiplos
var nao_multiplos = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready called")
	# Gerar um número aleatório entre 2 e 10
	var number_random = randi() % 9 + 2
	print("Random number generated: ", number_random)
	# Adicionar esse número ao primeiro botão
	button1.text = str(number_random)
	# Calcular os múltiplos desse número aleatório
	for i in range(2, 21):
		multiplos.append(number_random * i)
	print("Multiplos calculated: ", multiplos)
	# Preencher a lista de não múltiplos
	for i in range(1, 100):
		if i not in multiplos:
			nao_multiplos.append(i)
	print("Nao multiplos calculated: ", nao_multiplos)
	fill_buttons()

func fill_buttons():
	print("fill_buttons called")
	var index_multiplos = 0
	var index_nao_multiplos = 0
	var current_button = button1
	var buttons_path = [button1]
	var next_button
	var other_button
	
	while current_button != button16:
		var next_buttons = get_next_buttons(current_button)
		if next_buttons.size() == 0:
			break

		print("Next buttons: ", next_buttons)

		# Seleciona dois botões aleatórios diferentes dos próximos
		if next_buttons.size() > 1:
			next_button = next_buttons[randi() % next_buttons.size()]
			other_button = next_buttons[randi() % next_buttons.size()]
			while other_button == next_button:
				other_button = next_buttons[randi() % next_buttons.size()]
		else:
			next_button = next_buttons[0]
			other_button = next_buttons[0]

		print("Selected buttons: ", next_button, other_button)

		# Preenche os botões no caminho com múltiplos
		if index_multiplos < multiplos.size():
			next_button.text = str(multiplos[index_multiplos])
			index_multiplos += 1
		if index_nao_multiplos < nao_multiplos.size() and other_button != next_button:
			other_button.text = str(nao_multiplos[index_nao_multiplos])
			index_nao_multiplos += 1

		buttons_path.append(next_button)
		current_button = next_button

		# Adicione uma condição de saída para evitar loops infinitos
		if index_multiplos >= multiplos.size() and index_nao_multiplos >= nao_multiplos.size():
			break

	# Garantir que o último botão tenha um múltiplo
	button16.text = str(multiplos[index_multiplos - 1])
	print("Buttons path: ", buttons_path)

	# Preencher todos os botões
	var all_buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16]
	for button in all_buttons:
		if button.text == "":
			if button in buttons_path and index_multiplos < multiplos.size():
				button.text = str(multiplos[index_multiplos])
				index_multiplos += 1
			elif index_nao_multiplos < nao_multiplos.size():
				button.text = str(nao_multiplos[index_nao_multiplos])
				index_nao_multiplos += 1

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
	print("get_next_buttons for: ", button)
	return button_map.get(button, [])

func _on_button_pressed(button):
	# Verifica se o número clicado não é um múltiplo
	if int(button.text) not in multiplos:
		$Player.queue_free()
		Global.erro = true
		Global.sucesso = false
		get_tree().change_scene_to_file("res://scenes/Tela_final.tscn")

func _on_button_2_pressed():
	_on_button_pressed(button2)
func _on_button_3_pressed():
	_on_button_pressed(button3)
func _on_button_4_pressed():
	_on_button_pressed(button4)
func _on_button_5_pressed():
	_on_button_pressed(button5)
func _on_button_6_pressed():
	_on_button_pressed(button6)
func _on_button_7_pressed():
	_on_button_pressed(button7)
func _on_button_8_pressed():
	_on_button_pressed(button8)
func _on_button_9_pressed():
	_on_button_pressed(button9)
func _on_button_10_pressed():
	_on_button_pressed(button10)
func _on_button_11_pressed():
	_on_button_pressed(button11)
func _on_button_12_pressed():
	_on_button_pressed(button12)
func _on_button_13_pressed():
	_on_button_pressed(button13)
func _on_button_14_pressed():
	_on_button_pressed(button14)
func _on_button_15_pressed():
	_on_button_pressed(button15)
func _on_button_16_pressed():
	Global.erro = false
	Global.sucesso = true
	$Timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Tela_final.tscn")
