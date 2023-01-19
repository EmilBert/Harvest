extends Node2D

var cropCount = 0
var initCount = cropCount
onready var cropsCounter = get_node("/root/World/CropsCounter")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func removeCrop():
	cropCount -= 1
	cropsCounter.updateCount()


func addCrop():
	cropCount += 1


func _resetCrops():
	if Input.is_action_pressed("ui_select"):
		cropCount = 0
		initCount = cropCount
