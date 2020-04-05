extends Node2D

var current_shake_priority = 0

func move_camera(shake_vector):
	get_parent().get_node("Player").get_node("Camera2D").offset = Vector2(rand_range(-shake_vector.x , shake_vector.x) , rand_range(-shake_vector.y , shake_vector.y))
	

func camera_shake(shake_vector , shake_duration , shake_priority):
	$Tween.interpolate_method(
		self,
		"move_camera",
		Vector2(shake_vector , shake_vector),
		Vector2(0,0),
		1,
		Tween.TRANS_SINE,
		Tween.EASE_OUT,
		0
	)
	
	$Tween.start()
	

	
	


func _on_Tween_tween_all_completed():
	current_shake_priority = 0
