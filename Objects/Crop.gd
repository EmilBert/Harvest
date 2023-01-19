extends Node2D

onready var area: Area2D = get_node("Area2D")


func _ready():
	pass


func _on_Area2D_body_entered(_body: Node):
	# TODO: Send signal to game master to decrease remaining crop count
	# Destroy this object
	queue_free()
