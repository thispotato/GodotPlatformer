extends KinematicBody2D

const SPEED		= 100
const GRAVITY	= 10
const JUMP 		= -250
const FLOOR     = Vector2(0,-1)

var velocity 	= Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$King.play("run")
		velocity.x = SPEED
		$King.flip_h = false
	
	elif Input.is_action_pressed("ui_left"):
		$King.play("run")
		velocity.x = -SPEED
		$King.flip_h = true
		
	else:
		if is_on_floor():
			velocity.x = 0
			$King.play("idle")
			
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP
			$King.play("jump")
		
		
	velocity.y += GRAVITY
	move_and_slide(velocity , FLOOR)
