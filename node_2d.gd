extends Node2D

var speler = AudioStreamPlayer2D.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	_timestop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_timestop()
	

func _timestop():
	if Input.is_key_pressed(KEY_SPACE):
		Engine.time_scale = 0.05
		self.add_child(speler);
		speler.stream = load("res://sinal slow.wav");
		speler.play(true);
	else:
		Engine.time_scale = 1
