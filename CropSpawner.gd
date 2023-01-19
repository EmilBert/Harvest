extends Node2D

onready var farmableArea: TileMap = get_node("/root/World/SpawnableCropArea")
var usedCells
var crop = preload("res://Objects/Crop.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	usedCells = farmableArea.get_used_cells()
	var cellSize = farmableArea.map_to_world(usedCells[1]) - farmableArea.map_to_world(usedCells[0])
	for availablePlotCoordinate in usedCells.size():
		var cropInstance = crop.instance()
		cropInstance.position = (to_global(
			farmableArea.map_to_world(usedCells[availablePlotCoordinate]) + cellSize / 2
		))
		add_child(cropInstance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
