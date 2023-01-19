extends KinematicBody2D

const SPEED = 15000


var rot = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update movement vector
	
	
	var magnitude = 0
	var direction = Vector2(0, 0)	
	if Input.is_action_pressed("ui_right"): # Rotate the player rightwards
		rotation_degrees += 1
		rot += 1
	if Input.is_action_pressed("ui_left"):
		rotation_degrees  -= 1
		rot -= 1
	if Input.is_action_pressed("ui_down"): 
		magnitude = -SPEED
	if Input.is_action_pressed("ui_up"):
		magnitude = SPEED/2
	

	direction = Vector2.UP.rotated(deg2rad(rot)).normalized()

	var velocity = direction * magnitude * delta
	
	# Apply movement
	move_and_slide(velocity)

