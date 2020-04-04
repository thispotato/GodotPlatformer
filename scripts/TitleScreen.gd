extends Node2D


func _ready():
	if $"Sprite/MarginContainer/HContainer/Play".grab_focus():
		get_tree().quit()
	
		
	
func _physics_process(delta):
	if $"Sprite/MarginContainer/HContainer/Play".is_hovered():
		get_tree().quit()
