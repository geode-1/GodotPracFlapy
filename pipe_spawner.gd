extends Node2D



var pipe_list = [
	
	preload("res://pipe_down.tscn"),
	
	preload("res://pipe_up.tscn")
	
	
	
]

var pipe_up = preload("res://pipe_down.tscn")
var pipe_down = preload("res://pipe_up.tscn")
var point_area = preload("res://point_check.tscn")
var moving_obj = preload("res://moving_obj.tscn")


var position_base = Vector2(100, 100)
var variation_range = Vector2(100, 300)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipe():
	
	var pipe_up_instance = pipe_up.instantiate()
	get_node("pipe_marker_up").add_child(pipe_up_instance)
	
	var pipe_down_instance = pipe_down.instantiate()
	get_node("pipe_marker_down").add_child(pipe_down_instance)
	
	var point_area_instance = point_area.instantiate()
	get_node("point_marker").add_child(point_area_instance)
	
	var moving_onj_instance = moving_obj.instantiate()
	get_node("point_marker").add_child(moving_onj_instance)
	
	
	pipe_position(pipe_up_instance, pipe_down_instance, point_area_instance, moving_onj_instance) 
	
	
	

func pipe_position(UP_pipe_instance, DOWN_pipe_instance, MIDDLE_point_area_instance, MOVEMENT_obj_instance):
	var variation = Vector2(randf_range(-variation_range.x, variation_range.x), randf_range(-variation_range.y, variation_range.y))
	var new_position = position_base + variation
	UP_pipe_instance.position = new_position
	DOWN_pipe_instance.position = new_position
	MIDDLE_point_area_instance.position = new_position
	MOVEMENT_obj_instance.position = new_position
	



func _on_pipetimer_timeout():
	spawn_pipe()


func _on_diff_timer_timeout():
	pass
