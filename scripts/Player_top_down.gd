extends CharacterBody2D
var SPEED = 100.0
var click_position = Vector2()
var target_position = Vector2()
func _physics_process(delta):
	if Input.is_action_just_pressed("left_click"):
		click_position = get_global_mouse_position()
	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		$AnimatedSprite2D.play("wlak")
		velocity = SPEED*target_position
		move_and_slide()

