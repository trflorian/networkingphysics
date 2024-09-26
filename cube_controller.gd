extends RigidBody3D

const SPEED: float = 30.0

func _process(delta: float) -> void:
	if not multiplayer.is_server():
		return
	$Attractor.is_enabled = Input.is_action_pressed("attract")

func _physics_process(_delta: float) -> void:
	if not multiplayer.is_server():
		return
	
	var input = Input.get_vector(
		"move_left", "move_right",
		"move_backward", "move_forward",
	)
	
	if input.length() > 0:
		var dir = input.normalized()
		var dir3D = Vector3(dir.x, 0, -dir.y)
		apply_force(dir3D * SPEED, Vector3(0,0.1,0))
