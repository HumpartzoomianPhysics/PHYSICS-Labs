extends StaticBody3D

var speed : float = 10.0

func _process(delta):
	# Get the mouse position in the viewport
	var mouse_position = get_viewport().get_mouse_position()

	# Project the mouse position onto the near plane of the camera
	var camera = $Camera3D  # Adjust the path to your camera node
	var target_position = camera.project_ray_origin(mouse_position)

	# Calculate the direction from the player to the mouse position
	var look_direction = (target_position - global_transform.origin).normalized()

	# Rotate the player to face the mouse
	look_at(global_transform.origin + look_direction, Vector3(0, 1, 0))

	# Move the player based on input
	var movement = Vector3()

	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		movement.z += 1
	if Input.is_action_pressed("ui_up"):
		movement.z -= 1

	# Normalize the movement vector to avoid faster diagonal movement
	movement = movement.normalized()

	# Move the player using the calculated movement vector and the speed
	translate(movement * speed * delta)
