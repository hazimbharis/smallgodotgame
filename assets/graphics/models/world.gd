@tool
extends Node

@export var gridmap:GridMap
@export var world_bounds:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in world_bounds.x:
		for y in world_bounds.y:
			await get_tree().process_frame
			gridmap.set_cell_item(Vector3(x, 0, y), 0)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
