extends KinematicBody2D

const SPEED = 500
const FRICTION = 0.05
const ACCELERATOIN = 0.06
const ROTATION_SPEED = 3

var rot = 0
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update movement vector
	
	
	var magnitude = 0
	var direction = Vector2(0, 0)	
	if Input.is_action_pressed("ui_right"): # Rotate the player rightwards
		rotation_degrees += ROTATION_SPEED
		rot += ROTATION_SPEED
	if Input.is_action_pressed("ui_left"):
		rotation_degrees  -= ROTATION_SPEED
		rot -= ROTATION_SPEED
	if Input.is_action_pressed("ui_down"): 
		magnitude = -SPEED/2
	if Input.is_action_pressed("ui_up"):
		magnitude = SPEED
	

	direction = Vector2.UP.rotated(deg2rad(rot)).normalized()

	if magnitude != 0:
		# accelerate when there's input
		velocity.x = lerp(velocity.x, direction.x * magnitude, ACCELERATOIN)
		velocity.y = lerp(velocity.y, direction.y * magnitude, ACCELERATOIN)
	else:
		# slow down when there's no input
		velocity.x = lerp(velocity.x, 0, FRICTION)
		velocity.y = lerp(velocity.y, 0, FRICTION)
		
	# Apply movement
	move_and_slide(velocity)

