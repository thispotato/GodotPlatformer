extends KinematicBody2D

const SPEED     = 100
const GRAVITY   = 10
const FLOOR     = Vector2(0,-1)
const EXPLOSION = preload("res://scenes/Explosion.tscn")

var velocity    = Vector2()
var direction   = 1

func kill():
	var explosion = EXPLOSION.instance()
	add_child(explosion)
	$CollisionShape2D.disabled = true
	$Timer.start()
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
		
	if get_slide_count() > 1:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				queue_free()
			


func _on_Timer_timeout():
	queue_free()
	
