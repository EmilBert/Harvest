extends Node2D

var displayValue = 0
onready var timer: Timer = get_node("Timer")


func _ready() -> void:
	timer.set_wait_time(1)
	timer.start()
	_updateTimer()


func _on_Timer_timeout():
	displayValue += 1
	_updateTimer()


func _updateTimer():
	$Control/RichTextLabel.bbcode_text = "[center] Time: " + str(displayValue)
