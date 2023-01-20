extends Node2D

onready var area: Area2D = get_node("Area2D")
onready var gameMaster = get_node("/root/World")


func _ready():
	gameMaster.addCrop()
	pass


func _on_Area2D_body_entered(body: Node):
	# Destroy this object
	if body.name == "Tractor":
		if body.isGhost:
			gameMaster.removeCrop()
			queue_free()
