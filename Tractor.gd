extends KinematicBody2D

const SPEED = Vector2(0, -8)
const FRICTION = 0.05
const ACCELERATOIN = 0.06
const ROTATION_SPEED = 0.08
const minWheelAngle = 0.05
const driftResistance = 2.5
const maxSpeed = 700
var velocity = Vector2()

var rot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update movement vector
	
	
	var res = 4
	var direction = Vector2(0, 0)	
	if Input.is_action_pressed("ui_right"): # Rotate the player rightwards
		rotation += ROTATION_SPEED
		rot += ROTATION_SPEED
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATION_SPEED
		rot -= ROTATION_SPEED
	if Input.is_action_pressed("ui_down"): 
		res += 20
	if Input.is_action_pressed("ui_up"):
		velocity += SPEED.rotated(rotation)			

	if velocity.length() > res:
		# accelerate when there's input
		var angle = velocity.angle()-rotation
		
		if abs(sin(angle)) > minWheelAngle:
			velocity += Vector2(sin(angle) * driftResistance, 0).rotated(rotation) 
		else:
			velocity *= abs(cos(angle))
		
		velocity -= velocity.normalized() * res
		
	else:
		# slow down when there's no input
		velocity = Vector2()
		
	# Apply movement
	velocity = move_and_slide(velocity)

