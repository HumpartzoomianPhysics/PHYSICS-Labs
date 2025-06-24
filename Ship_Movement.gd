extends Sprite2D

var acceleration: float = 50
#var max_speed: float = 500
var isfollowing: bool = false
var turn_speed: float = 8.0

var velocity = Vector2.ZERO
var pixels_to_meters = 0.01  # 1 pixel = 0.01 meters (adjust if needed)

func _process(delta):
	reset()
	var mouse_position = get_global_mouse_position()

	if isfollowing:
		var direction = (mouse_position - global_position).normalized()

		# Smoothly rotate to face the mouse position
		rotation = lerp_angle(rotation, direction.angle(), turn_speed * delta)

		# Accelerate the object forward
		velocity += direction * acceleration * delta

	var velocity_mps = velocity * pixels_to_meters
	var time_elapsed = Time.get_ticks_msec() / 1000.0  # Time in seconds

	# Update UI text
	$UI/Control/Label.text = "Time: %.2f s | Velocity: %.2f m/s" % [time_elapsed, velocity_mps.length()]

	# Limit the speed to the maximum speed
	#velocity = velocity.normalized() * min(velocity.length(), max_speed)

	# Move the object
	global_position += velocity * delta

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_space"):
			isfollowing = true
			$Fire.show()
		elif event.is_action_released("ui_space"):
			isfollowing = false
			$Fire.hide()


func _on_button_button_down():
	isfollowing = true
	$Fire.show()

func _on_button_button_up():
	isfollowing = false
	$Fire.hide()

func reset():
	if Input.is_action_just_pressed('reset'):
		get_tree().reload_current_scene()
