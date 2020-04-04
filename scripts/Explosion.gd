extends AnimatedSprite


func _ready():
	pass


func _on_Explosion_animation_finished():
	print(get_parent().name)
