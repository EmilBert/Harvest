extends Node2D

var cropCount = 0
var initCount = cropCount
onready var cropsCounter = $CropSpawner/CropsCounter
onready var crombo = $Crombo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func removeCrop():
	cropCount -= 1
	cropsCounter.updateCount()
	crombo.increaseCrombo()


func addCrop():
	cropCount += 1


func _resetCrops():
	cropCount = 0
	initCount = cropCount
