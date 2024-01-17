extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var times_jumped = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") :
		velocity.y = JUMP_VELOCITY
		times_jumped += 1
		
		

	move_and_slide()




func _on_death_zone_body_entered(body):
	get_tree().change_scene_to_file("res://game_over.tscn")
