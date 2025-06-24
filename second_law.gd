extends Control

func _process(delta):
	$m1.text = str($Mass1.value) + " Kg"
	$a1.text = str($Acceleration1.value) + " m/s²"
	$m2.text = str($Mass2.value) + " Kg"
	$a2.text = str($Acceleration2.value) + " m/s²"

func _on_reset_button_down():
	get_tree().reload_current_scene()
