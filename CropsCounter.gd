extends Node2D

var count = 0
var initCount
onready var gameMaster


# Called when the node enters the scene tree for the first time.
func _ready():
	gameMaster = get_parent().get_parent()
	pass


func updateCount():
	count = gameMaster.cropCount
	$Control/RichTextLabel.bbcode_text = "[center]" + str(count)
