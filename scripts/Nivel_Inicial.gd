extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	$ParallaxBackground/Coin/Label.text = str(Global.moedas)
