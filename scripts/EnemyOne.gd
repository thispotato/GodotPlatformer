extends KinematicBody2D

const SPEED     = 100
const GRAVITY   = 10
const FLOOR     = Vector2(0,-1)

var velocity    = Vector2()
var direction   = 1

# warning-ignore:unused_argument
func _physics_process(delta):
	velocity.x = SPEED * direction
	$AnimatedSprite.play("run")
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	velocity.y += GRAVITY
	move_and_slide(velocity , FLOOR)
	
	if $RayCast2D.is_colliding() == false:
		direction *= -1
		#remember to note this during with the Position2D
		$RayCast2D.position.x *= -1
	if is_on_wall():
		direction *= -1
