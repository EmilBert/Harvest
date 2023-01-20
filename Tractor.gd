extends KinematicBody2D

const SPEED = Vector2(0, -600)
const FRICTION = 0.02
const ACCELERATOIN = 0.06
var ROTATION_SPEED = 0.08
const minWheelAngle = 0.05
const driftResistance = 20
var speedModifier = 1
var velocity = Vector2()
var rot = 0

var speedTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	speedTimer = Timer.new()
	add_child(speedTimer)
	speedTimer.connect("timeout", self, "_on_timer_timeout")
	speedTimer.set_wait_time(3)

	pass  # Replace with function body.


func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update movement vector

	var res = 4
	var inSpeed = 0
	#var direction = Vector2(0, 0)
	if Input.is_action_pressed("steer_right"):
		rotation += ROTATION_SPEED
		rot += ROTATION_SPEED
	if Input.is_action_pressed("steer_left"):
		rotation -= ROTATION_SPEED
		rot -= ROTATION_SPEED
	if Input.is_action_pressed("break"):
		res += 15
	if Input.is_action_pressed("gas"):
		inSpeed = 1

	if inSpeed != 0 || speedModifier > 1:
		velocity.x = lerp(velocity.x, speedModifier * SPEED.rotated(rotation).x, ACCELERATOIN)  #get the correct speed direction on the wheels(their rotation decides)
		velocity.y = lerp(velocity.y, speedModifier * SPEED.rotated(rotation).y, ACCELERATOIN)
		# accelerate when there's input
		var angle = velocity.angle() - (rotation - PI / 2)  #diffrence in angle between the wheels and the front of the tractor (-pi/2 is from the wheels default rotation)

		if abs(sin(angle)) > minWheelAngle:  #Is the turn big enough to give a drift, then drift
			velocity += Vector2(sin(angle) * driftResistance, 0).rotated(rotation)
			# Activate drift smoke
			$DriftSmoke1.emitting = true
			$DriftSmoke2.emitting = true

		else:
			velocity *= abs(cos(angle))
			$DriftSmoke1.emitting = false
			$DriftSmoke2.emitting = false

		velocity -= velocity.normalized() * res  #apply breaking

	else:
		# slow down when there's no input
		velocity.x = lerp(velocity.x, 0, FRICTION)
		velocity.y = lerp(velocity.y, 0, FRICTION)

		velocity -= velocity.normalized() * res  #apply breaking

	if velocity.length() < 200:
		$DriftSmoke1.emitting = false
		$DriftSmoke2.emitting = false

	# Apply movement
	var collision = move_and_collide(velocity * delta)
	if collision:
		if velocity.length() > 300:
			velocity = collision.normal * velocity.length() / 2
		else:
			velocity = velocity.slide(collision.normal)


func _input(event):
	if Input.is_action_pressed("Attachment1"):
		_noAttachment()
	if Input.is_action_pressed("Attachment2"):
		_combine()
	if Input.is_action_pressed("Attachment3"):
		_ghostMode()


func _noAttachment():
	ROTATION_SPEED = 0.08


func _combine():
	ROTATION_SPEED = 0.02


func _ghostMode():
	ROTATION_SPEED = 0.08


func turbo():
	speedTimer.start()
	$Fire.emitting = true
	speedModifier = 2
	pass


func _on_timer_timeout():
	$Fire.emitting = false
	speedTimer.stop()
	speedModifier = 1
