extends Area2D

const SPEED = 150

var velocity = Vector2()
var direction = 1

func set_bullet_direction(dir):
	dir = direction
	if dir == 1:
		$Sprite.flip_h = false
	
	else:
		$Sprite.flip_v = true
		$Sprite.flip_h = true

func _physics_process(delta):
	velocity.x  = delta * SPEED * direction
	translate(velocity)
	


func _on_VisibilityNotifier2D_screen_exited():
	
	queue_free()
