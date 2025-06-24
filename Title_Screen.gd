extends Node2D

@onready var transition = $Transition

@export var speed: int = 400

var direction = Vector2(0, 1)

var mainlevel = preload("res://Main_Scene.tscn")

@onready var parallax = $ParallaxBackground

func _process(delta):
	# Move the parallax background based on global position
	parallax.scroll_offset += global_transform.y * direction * speed * delta


func _on_scene_switcher_pressed():
	transition.play("Fade")

func _on_transition_animation_finished(Fade):
	get_tree().change_scene_to_packed(mainlevel)
