extends Node2D

var count = 0
var maxCrombo = 0

onready var pb = get_node("Control/ProgressBar")
onready var gameMaster = get_node("/root/World")

var maxTime = 1.0
var delta  = 0.03
var value = 0.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func increaseCrombo():
	count = count + 1
	$Control/RichTextLabel.bbcode_text = "[center]" + str(count)
	value = maxTime
	
	
func _process(delta):
	if value > 0.0:
		value -= delta
	else:
		if count > maxCrombo :
			maxCrombo = count
		count = 0
		$Control/RichTextLabel.bbcode_text = "[center]" + str(count)
	pb.value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
