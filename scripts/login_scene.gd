extends Control

class Login:
	var Usuario : String
	var Senha : String
	func verificar_login(usuario_novo, senha_nova):
		self.Usuario = usuario_novo
		self.Senha = senha_nova

func _on_button_enter_pressed():
	var User = $MarginContainer/CenterContainer/VBoxContainer/MarginContainer/LineEdit.text
	var password = $MarginContainer/CenterContainer/VBoxContainer/MarginContainer2/LineEdit2.text
	var login = Login.new()
	login.verificar_login(User, password)
	for account in Global.Logins_Salvos:
		if account.cpf == login.Usuario and account.senha == login.Senha:
			get_tree().change_scene_to_file("res://scenes/plataforma.tscn")
	var erro_de_login : String = "Usuário e senha não encontrados"
	$MarginContainer/CenterContainer/VBoxContainer/Label3.text = erro_de_login
	
func _button_not_account_pressed():
	get_tree().change_scene_to_file("res://scenes/cadastro.tscn")
