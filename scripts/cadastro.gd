extends Control
# vou criar duas variáveis para armazenar os valores do CPF e a senha

# aqui viu criar uma classe para armazenar as informações de usuário e senha cadastrados
class Conta:
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
	var minha_conta = Conta.new()
	minha_conta.dados_do_usuario(CPF, Senha)
	Global.Logins_Salvos.append(minha_conta)
	print(Global.Logins_Salvos)
	
func _on_button_back_to_main_scene():
	get_tree().change_scene_to_file("res://scenes/login_scene.tscn")
