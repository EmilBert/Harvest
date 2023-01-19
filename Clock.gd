extends Node2D

var value = 0
onready var timer: Timer = get_node("Timer")


# Init
func _ready() -> void:
	timer.set_wait_time(1)
	timer.start()
	_updateTimer()


# Timer timeout happens every timer tick
func _on_Timer_timeout():
	value += 1
	_updateTimer()


func _updateTimer():
	$Control/RichTextLabel.bbcode_text = "[center] Time: " + str(value)


func _resetTimer():
	if Input.is_action_pressed("ui_select"):
		timer.stop()
		value = 0
		_updateTimer()
		timer.start()


# Helper function to reset timer. This should not be used in the actual game.
func _input(event):
	if event.is_action_pressed("ui_select"):
		_resetTimer()
