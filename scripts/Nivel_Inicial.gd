extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	$ParallaxBackground/Coin/Label.text = str(Global.moedas)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/login_scene.tscn")
