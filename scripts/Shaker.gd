extends Node2D


var current_shake_priority = 0

func _ready():
	pass
	
func move_camera(vector):
	get_parent().get_parent().get_node("Player").get_node("Camera2D").offset = Vector2(rand_range(-vector.x , vector.x)  , rand_range(-vector.y , vector.y))

func camera_shake(duration , shake_vector ,  priority):
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


func _on_Tween_tween_all_completed():
	current_shake_priority = 0
