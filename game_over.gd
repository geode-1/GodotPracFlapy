extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Score_label.text = "Score: " + str(GlobalLogic.total_points)


func _on_try_again_pressed():
	GlobalLogic.total_points = 0
	get_tree().change_scene_to_file("res://world.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
