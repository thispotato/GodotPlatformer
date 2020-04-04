extends Node2D


func _ready():
	#The game starts with focus on the play button
	$Sprite/MarginContainer/HContainer/Play.grab_focus()
	
		
	
func _physics_process(_delta):
	#on hover make the button clickable
	if $"Sprite/MarginContainer/HContainer/Play".is_hovered():
		$Sprite/MarginContainer/HContainer/Play.grab_focus()
	
	if $"Sprite/MarginContainer/HContainer/Exit".is_hovered():
		$Sprite/MarginContainer/HContainer/Exit.grab_focus()		
		


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/StageOne.tscn")
func _on_Exit_pressed():
	get_tree().quit()
