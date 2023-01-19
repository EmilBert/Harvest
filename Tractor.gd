extends KinematicBody2D

const SPEED = 50


var magnitude = 0
var rot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update movement vector
	
	var direction = Vector2(0, 0)
		
	if Input.is_action_pressed("ui_right"): # Rotate the player rightwards
		rotation += 1
		rot += 1
	if Input.is_action_pressed("ui_left"):
		rotation -= 1
		rot -= 1
	if Input.is_action_pressed("ui_down"): 
		magnitude -= SPEED
	if Input.is_action_pressed("ui_up"):
		magnitude += SPEED/2
	

	direction = Vector2.UP.rotated(rotation).normalized()

	var velocity = direction.rotated(rot).normalized() * magnitude * delta
	
	# Apply movement
	move_and_slide(velocity)

