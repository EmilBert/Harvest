extends Node2D

onready var cropArea: TileMap = get_node("/root/World/SpawnableCropArea")
onready var bounceArea: TileMap = get_node("/root/World/SpawnableCropAreaBounce")
onready var turboArea: TileMap = get_node("/root/World/SpawnableCropAreaTurbo")
onready var ghostArea: TileMap = get_node("/root/World/SpawnableCropAreaGhost")
onready var counterSign = get_node("/root/World/CropsCounter")

var usedCells
var crop = preload("res://Objects/Crop.tscn")
var bounceCrop = preload("res://Objects/CropBounce.tscn")
var turboCrop = preload("res://Objects/CropTurbo.tscn")
var ghostCrop = preload("res://Objects/CropGhost.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	_spawnCrops(crop, cropArea)
	_spawnCrops(bounceCrop, bounceArea)
	_spawnCrops(turboCrop, turboArea)
	_spawnCrops(ghostCrop, ghostArea)


func _spawnCrops(inCrop, inArea):
	# Spawn regular crops
	usedCells = inArea.get_used_cells()

	for availablePlotCoordinate in usedCells.size():
		var cropInstance = inCrop.instance()
		var offset = Vector2(3, -3)
		cropInstance.position = (
			(to_global(inArea.map_to_world(usedCells[availablePlotCoordinate])))
			+ offset
		)

		add_child(cropInstance)

	# All have spawned, add count to sign
	counterSign.updateCount()
