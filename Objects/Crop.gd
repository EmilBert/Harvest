extends Node2D

onready var area: Area2D = get_node("Area2D")
onready var gameMaster


func _ready():
	gameMaster = get_parent().get_parent()  #Should be the level
	gameMaster.addCrop()
	pass


func _on_Area2D_body_entered(body: Node):
	# TODO: Send signal to game master to decrease remaining crop count
	# Destroy this object
	if body.name == "Tractor":
		if body.isGhost == true:
			return
		gameMaster.removeCrop()
		queue_free()
