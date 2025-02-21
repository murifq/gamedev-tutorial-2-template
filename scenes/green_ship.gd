extends Node2D

@export var acceleration: float = 500.0  # How fast the ship speeds up
@export var max_speed: float = 400.0  # Maximum movement speed
@export var friction: float = 0.98  # How fast the ship slows down
@export var gravity: float = 200.0  # Gravity force pulling down

var velocity: Vector2 = Vector2.ZERO  # Stores ship velocity

func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	# Capture movement input
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# Normalize to prevent diagonal speed boost
	if direction.length() > 0:
		direction = direction.normalized()

	# Apply acceleration to velocity
	velocity += direction * acceleration * delta

	# Apply gravity (pulls down over time)
	velocity.y += gravity * delta

	# Limit speed
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed

	# Apply friction when no input is given
	velocity *= friction

	# Move the ship
	position += velocity * delta
