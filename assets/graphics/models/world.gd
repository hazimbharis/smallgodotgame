@tool
extends Node

@export var gridmap:GridMap
@export var world_bounds:Vector2

@export var packed_pillar:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instances = get_tree().get_nodes_in_group("instances")
	for i in instances:
		i.queue_free()
		#print(i)
	gridmap.clear()
	
	for x in world_bounds.x:
		for y in world_bounds.y:

			gridmap.set_cell_item(Vector3(x, 0, y), [0, 1, 2, 3, 4, 5, 6, 7].pick_random())
			if randf() < 0.1:
				var height = randi_range(2, 5)
				for i in height:
					gridmap.set_cell_item(Vector3(x, i, y), 8)
				if randf() < 0.05:
					gridmap.set_cell_item(Vector3(x, height, y), 9)
				else:
					gridmap.set_cell_item(Vector3(x, height, y), [0, 1, 2, 3, 4, 5, 6, 7].pick_random())
	
	gridmap.position = Vector3(-world_bounds.x, 0, -world_bounds.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
