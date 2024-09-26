extends RigidBody3D

var attractors: Array[Attractor]

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("attractor"):
		attractors.append(node as Attractor)

func _physics_process(_delta: float) -> void:
	for attractor in attractors:
		if not attractor.is_enabled:
			continue
		var diff = attractor.global_position - global_position
		var dist = diff.length()
		apply_central_force(diff.normalized() / (dist * dist) * attractor.attraction_force)
