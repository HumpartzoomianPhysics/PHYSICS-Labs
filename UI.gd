extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pressed1():
	$Messages/Controls1.hide()
	$Messages/Controls1/TextureButton.hide()
	$Messages/NewtonsFirstLaw2.show()
	$Messages/NewtonsFirstLaw2/TextureButton.show()

func pressed2():
	$Messages/NewtonsFirstLaw2.hide()
	$Messages/NewtonsFirstLaw2/TextureButton.hide()
	$Messages/Inertia3.show()
	$Messages/Inertia3/TextureButton.show()

func pressed3():
	$Messages/Inertia3.hide()
	$Messages/Inertia3/TextureButton.hide()
	$Messages/Forever4.show()
	$Messages/Forever4/TextureButton.show()

func pressed4():
	$Messages/Forever4.hide()
	$Messages/Forever4/TextureButton.hide()
	$Messages/Stop5.show()
	$Messages/Stop5/TextureButton.show()

func pressed5():
	$Messages/Stop5.hide()
	$Messages/Stop5/TextureButton.hide()
	$Messages/Lab6.show()
	$Messages/Lab6/TextureButton.show()

func pressed6():
	$Messages/Lab6.hide()
	$Messages/Lab6/TextureButton.hide()
	$Messages/End7.show()
	$Messages/End7/TextureButton.show()

func pressed7():
	$Messages/End7.hide()
	$Messages/End7/TextureButton.hide()
