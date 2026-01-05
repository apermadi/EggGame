extends CharacterBody2D

const GRAVITY = 250.0
const WALK_SPEED = 550.0
const ACCELERATION = 450.0

func _physics_process(delta: float) -> void:
	velocity.y += delta * GRAVITY
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = move_toward(velocity.x, -WALK_SPEED, ACCELERATION * delta)
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = move_toward(velocity.x, WALK_SPEED, ACCELERATION * delta)
	else:
		velocity.x = 0
		
	move_and_slide()
