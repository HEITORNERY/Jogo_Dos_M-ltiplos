extends Node2D
# a plataforma precisa de uma velocidade
@export var move_speed = 3.0
# a plataforma precisa de uma distância para percorrer
@export var distance = 192
# se a plataforma estiver configurada para ir na horizontal ela vai, senão ela vai ir na vertical
@export var mover_horizontal = true
# criar uma variável para ser modificada sua posição por meio da tween
var movemento_tween := Vector2.ZERO
# uma variável para guardar a posição do centro da plataforma, pois será necessário pro cálculo do tempo de movimento 
var platform_center = 24.0
# chamar a função de animação por meio da tween 
func _ready():
	movement()
# interpolar as posições por meio da animação usando o lerp dentro da process
func _physics_process(delta):
	$AnimatableBody2D.position = $AnimatableBody2D.position.lerp(movemento_tween, 0.5) 
# criar a função para movimentar 
func movement():
	# criar uma variável para movimentar a plataforma, que vai ser usada na tween
	var move_direction = Vector2.RIGHT*distance if mover_horizontal else Vector2.UP*distance
	# criar o tempo para a animação da tween
	var movement_time = (move_direction.length()/float(move_speed*platform_center))
	# criar uma tween, para isso é preciso criar uma variável e usar o create_tween
	var tween_platform = create_tween().set_loops() # se nenhum valor de loop for colcado vai ser infinitos loops
	# mudar a propriedade da posição da plataforma com o tween
	tween_platform.tween_property(self, "movemento_tween", move_direction, movement_time)
	# fazer a plataforma voltar é só mudar a move_direction para vector2.zero
	tween_platform.tween_property(self, "movemento_tween", Vector2.ZERO, movement_time)
	
