extends Node2D

var count = 0
var maxCrombo = 0

onready var pb = get_node("Control/ProgressBar")
onready var gameMaster = get_node("/root/World")
onready var showTextTimer = Timer.new()

var maxTime = 1.0
var delta = 0.03
var value = 0.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	showTextTimer = Timer.new()
	add_child(showTextTimer)
	showTextTimer.connect("timeout", self, "_on_timer_timeout")
	showTextTimer.set_wait_time(2)


func increaseCrombo():
	count = count + 1
	$Control/RichTextLabel.bbcode_text = "[center]" + str(count)
	value = maxTime


func _process(delta):
	if value > 0.0:
		value -= delta
	else:
		if count > maxCrombo:
			maxCrombo = count
		if count != 0:
			_displayPraise(count)
			count = 0

		$Control/RichTextLabel.bbcode_text = "[center]" + str(count)
	pb.value = value


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _displayPraise(inVal):
	if inVal > 900:
		showTextTimer.start()
		$Praise.bbcode_text = (
			"[center][color=#FFD700][wave amp=70 freq=4]"
			+ str(count)
			+ " crops.\nAgricultural GOD[/wave][/color]"
		)
	elif inVal > 650:
		showTextTimer.start()
		$Praise.bbcode_text = (
			"[center][color=#C0C0C0][shake rate=30 level=15]"
			+ str(count)
			+ " crops.\nCriminally Cultivated!![/shake][/color]"
		)
	elif inVal > 400:
		showTextTimer.start()
		$Praise.bbcode_text = (
			"[center][color=#CD7F32]"
			+ str(count)
			+ " crops.\nWheat Wonder![/color]"
		)


func _on_timer_timeout():
	showTextTimer.stop()
	$Praise.bbcode_text = "[center]"
