extends CharacterBody2D
# aqui são as variáveis necessárias para dar velociadade ao movimento do player, o pulo e uma desaceleração
const SPEED = 150
const JUMP_VELOCITY = -400
const desaceleration = 150
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	animation()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	# se as teclas da esquerda ou direita forem pressionadas a velocidade do player vai receber o valor de speed
	if direction:
		velocity.x = direction * SPEED
	else: # se a tecla foi solta, o player começará a desacelerar
		velocity.x = move_toward(velocity.x, 0, desaceleration)
	move_and_slide()
# função para lidar com animações
func animation():
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	if velocity.y != 0:
		$AnimatedSprite2D.play("jump")
