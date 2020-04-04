extends KinematicBody2D

const SPEED		= 100
const GRAVITY	= 10
const JUMP 		= -350
const FLOOR     = Vector2(0,-1)
const BULLET    = preload("res://scenes/Bullet.tscn")

var velocity 	= Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$King.play("run")
		velocity.x = SPEED
		$King.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	
	elif Input.is_action_pressed("ui_left"):
		$King.play("run")
		velocity.x = -SPEED
		$King.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
			print("moved position2D")
		
	else:
		if is_on_floor():
			velocity.x = 0
			$King.play("idle")
			
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP
			$King.play("jump")
			
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = BULLET.instance()
		if sign($Position2D.position.x) == 1:
			bullet.set_bullet_direction(1)
		else:
			bullet.set_bullet_direction(-1)
			bullet.direction  =  -1
			
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
		
		
	velocity.y += GRAVITY
	move_and_slide(velocity , FLOOR)
