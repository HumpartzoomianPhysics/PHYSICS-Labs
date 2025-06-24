extends Control

@onready var boat = $Sprite2D
@onready var played = false

var target_size = Vector2(0.22, 0.22)
var min_size = Vector2(0.3, 0.3)

var speed = 0.0

var speed_multiplier = 300.0

func _ready():
	if played == false:
		$"../f1".text = "Force: --N"
	
	boat.scale = min_size

func _process(delta):
	boat.scale = boat.scale.lerp(target_size, 0.1)

	if played:
		boat.position.x += speed * delta

func _on_mass_1_value_changed(value):
	print("Mass 1 changed to: ", value)
	
	target_size = Vector2(value / 200, value / 200)

	recalculate_speed()

func _on_acceleration_1_value_changed(value):
	print("Acceleration changed to: ", value)
	
	recalculate_speed()

func recalculate_speed():
	var mass = $"../Mass1".value 
	var acceleration = $"../Acceleration1".value 
	
	# Calculate force
	var force = mass * acceleration
	print("Force: ", force)
	$"../f1".text = "Force: " + str(force) + "N"
	
	if played == false:
		$"../f1".text = "Force: --N"
	
	# Calculate speed proportional to mass
	if played:
		if mass > 0:
			speed = (acceleration * speed_multiplier) / mass
		else:
			speed = 0 

func _on_button_button_down():
	played = true
	recalculate_speed()
	$"../Play".disabled = true

func _on_area_2d_area_entered(area):
	played = false
