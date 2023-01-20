extends Node2D

onready var area: Area2D = get_node("Area2D")
onready var gameMaster = get_node("/root/World")
onready var tractor = get_node("/root/World/Tractor")


func _ready():
	gameMaster.addCrop()
	pass


func _on_Area2D_body_entered(body: Node):
	# TODO: Send signal to game master to decrease remaining crop count
	# Destroy this object
	if body.name == "Tractor":
		gameMaster.removeCrop()
		# TODO: Add bounce
		#tractor.bounce(position)
		queue_free()
