extends Node2D



func move_camera(vector):
	#get the Enemy's current root to access the Camera2D in the Player's node and assign it offset 
	#values to move the camera 
	get_parent().get_parent().get_node("Player").get_node("Camera2D").offset = Vector2(rand_range(-vector.x , vector.x)  , rand_range(-vector.y , vector.y))

func camera_shake(duration , shake_vector):
	$Tween.interpolate_method(
		self,
		"move_camera",
		Vector2(shake_vector , shake_vector),
		Vector2(0,0),
		duration,
		Tween.TRANS_SINE,
		Tween.EASE_OUT,
		0
	)
	
	$Tween.start()
