extends Camera3D

const OFFSET := Vector3(0, 4, 5)

@export var cube: RigidBody3D

func _process(delta: float) -> void:
	var target = cube.global_position + cube.linear_velocity + OFFSET
	global_position = global_position.lerp(target, delta)
	
