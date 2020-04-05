extends KinematicBody2D

const SPEED		= 100
const BOOST     = 150
const GRAVITY	= 10
const JUMP 		= -350
const FLOOR     = Vector2(0,-1)
const BULLET    = preload("res://scenes/Bullet.tscn")
const GHOST     = preload("res://scenes/Ghost.tscn")

var velocity 	= Vector2()


func kill():
	$CollisionShape2D.disabled = true
	$Kill_Timer.start()
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_down"):
			velocity.x = BOOST
		else:
			velocity.x = SPEED
			
		$King.play("run")
		$King.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_down"):
			velocity.x = -BOOST
		else:
			velocity.x = -SPEED
			
		$King.play("run")
		$King.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1

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
		
	#for the ghost effect:
	#add the ghost instance
	#make it a child of the Player's parent(StageOne in this Case)
	#make its position the player's current position
	#Get the Player's animation current frame 
	#Set its flip property to the Players to ensure it works
	if get_slide_count() > 1:
		for i in range(get_slide_count()):
			if "Enemy" in get_slide_collision(i).collider.name:
				kill()
	
						
	velocity.y += GRAVITY
	move_and_slide(velocity , FLOOR)

func _on_Ghost_Timer_timeout():
	if Input.is_action_pressed("ui_down"):
		var ghost = GHOST.instance()
		get_parent().add_child(ghost)
		ghost.position = position
		ghost.texture =$King.frames.get_frame($King.animation , $King.frame) #set the ghost texture to the current frame of the current animation
		ghost.flip_h = $King.flip_h


func _on_Kill_Timer_timeout():
	queue_free()
