extends Node2D

@onready var transition = $Player_Controller/UI/Transition
@onready var camera = $Player_Controller/Spaceship/Camera

var zoom_speed = 5.0  # Adjust smoothness
var min_zoom = Vector2(0.6, 0.6)
var max_zoom = Vector2(1.5, 1.5)

var target_zoom = Vector2(1.0, 1.0)  # Target zoom level
var zooming = false  # Track if zooming is active

func _ready():
	target_zoom = camera.zoom  # Initialize target zoom
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		print("Phone Browser")
		$Player_Controller/Spaceship/UI/Button.show()
	else:
		print("Computer Browser")
		$Player_Controller/Spaceship/UI/Messages/Controls1.show()
		$Player_Controller/Spaceship/UI/Messages/Controls1/TextureButton.show()

func _process(delta):
	# Only interpolate if zooming is active
	if zooming:
		camera.zoom = camera.zoom.lerp(target_zoom, zoom_speed * delta)

# Zoom in button handlers
func _on_button_button_down():
	zooming = true
	target_zoom = (camera.zoom - Vector2(0.2, 0.2)).clamp(min_zoom, max_zoom)

func _on_button_button_up():
	zooming = false  # Stop updating zoom
	target_zoom = camera.zoom  # Ensure no drift

# Zoom out button handlers
func _on_button_2_button_down():
	zooming = true
	target_zoom = (camera.zoom + Vector2(0.2, 0.2)).clamp(min_zoom, max_zoom)

func _on_button_2_button_up():
	zooming = false  # Stop updating zoom
	target_zoom = camera.zoom  # Ensure no drift
