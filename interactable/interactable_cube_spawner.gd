extends Node3D

@export var grid_size: int
@export var grid_spacing: float
@export var cube_prefab: PackedScene

func _ready() -> void:
	for x in range(grid_size):
		for y in range(grid_size):
			var instance = cube_prefab.instantiate() as Node3D
			add_child(instance)
			
			instance.global_position = Vector3(
				-grid_size*grid_spacing/2 + x*grid_spacing,
				0.15,
				-grid_size*grid_spacing/2 + y*grid_spacing,
			)
