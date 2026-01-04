extends CharacterBody2D

const GRAVITY = 250.0
const WALK_SPEED = 250.0

func _physics_process(delta: float) -> void:
	velocity.y += delta * GRAVITY
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0
		
	move_and_slide()
