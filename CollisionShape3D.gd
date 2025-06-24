extends CollisionShape3D


var ray_origin = Vector3()
var ray_target = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	ray_origin = $Camera3D.project_ray_origin(mouse_position)
	ray_target = ray_origin + $Camera3D.project_ray_normal(mouse_position) * 2000
	var space_state = get_world_3d().direct_space_state
	var intersection = space_state.intersect_ray(ray_target)
	if not intersection.empty():
		var pos = intersection.position
		var lookatme = Vector3(pos.x, $CharacterBody3D.translation.y, pos.z)
		$CharacterBody3D.look_at(lookatme, Vector3.UP)
