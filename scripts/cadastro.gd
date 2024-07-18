extends Control
# aqui vou criar uma classe para armazenar as informações de usuário e senha cadastrados
class Conta:
	# vou criar duas variáveis para armazenar os valores do CPF e a senha
	var cpf : String
	var senha : String
	func dados_do_usuario(novo_cpf, nova_senha):
		cpf = novo_cpf
		senha = nova_senha
	func _to_string():
		return  cpf + ", " + senha 

# Assim que for pressionado o botão de cadastrar esses dados serão salvos 
func _on_button_pressed():
	var CPF : String = $MarginContainer/CenterContainer/VBoxContainer/MarginContainer/LineEdit.text
	var Senha : String = $MarginContainer/CenterContainer/VBoxContainer/MarginContainer2/LineEdit2.text
	if validar_cpf(CPF):
		var minha_conta = Conta.new()
		minha_conta.dados_do_usuario(CPF, Senha)
		Global.Logins_Salvos.append(minha_conta)
	
func _on_button_back_to_main_scene():
	get_tree().change_scene_to_file("res://scenes/login_scene.tscn")

func validar_cpf(cpf_validado) -> bool:
	# o cpf vai ter 14 caracteres, mas só 11 serão números
	cpf_validado = cpf_validado.replace(".","").replace("-","")
	if len(cpf_validado) != 11:
		$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF inválido"
		return false
	# todos os 11 elementos devem ser números
	var numeros_do_cpf : Array = [] 
	for letra in cpf_validado:
		if letra.is_valid_int():
			letra = int(letra)
			numeros_do_cpf.append(int(letra))
		else:
			$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF inválido"
			return false
	# os primeiros nove números serão usados para verificar se os dígitos verificadores do cpf
	var soma = 0
	var somatorio = 0
	for i in range(0,9):
		soma += numeros_do_cpf[i]*(i+1)
	var primeiro_digito_verificador = (soma) % 11
	if primeiro_digito_verificador == 10:
			primeiro_digito_verificador = 0
	if primeiro_digito_verificador == numeros_do_cpf[9]:
			# passou na primeira verificação
			for number in range(0,10):
				somatorio += numeros_do_cpf[number]*number
			var segundo_digito_verificador = (somatorio) % 11
			if segundo_digito_verificador == 10:
					segundo_digito_verificador = 0
			if segundo_digito_verificador == numeros_do_cpf[10]:
				# é um cpf válido
				$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF Válido, seu cadastro foi bem sucedido"
				return true
			else:
				# reprovou na segunda verificação
				$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF inválido"
				return false
	else:
		$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF inválido"
		return false
	$MarginContainer/CenterContainer/VBoxContainer/Label3.text = "CPF inválido"
	return false
