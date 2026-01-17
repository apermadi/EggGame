extends CharacterBody2D

@export var gravity : float = 250.0
@export var walk_speed : float = 550.0
@export var acceleration : float = 450.0

func _physics_process(delta: float) -> void:
	velocity.y += delta * gravity
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = move_toward(velocity.x, -walk_speed, acceleration * delta)
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = move_toward(velocity.x, walk_speed, acceleration * delta)
	else:
		velocity.x = 0
		
	move_and_slide()
