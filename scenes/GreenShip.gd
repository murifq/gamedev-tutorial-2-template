extends RigidBody2D

@export var thrust_power: float = 3000.0  # Forward thrust
@export var turn_speed: float = 3.0  # Rotation speed
@export var max_speed: float = 400.0  # Maximum movement speed
@export var friction: float = 0.98  # Speed reduction over time
@export var turn_force: float = 800.0  # Lateral thrust when turning

func _physics_process(delta: float) -> void:
	var thrust := Vector2.ZERO
	var lateral_force := Vector2.ZERO

	# Move Forward (Thrust)
	if Input.is_action_pressed("move_up"):
		thrust = Vector2.UP.rotated(rotation) * thrust_power  # Moves in the direction of rotation

	# Rotate and move sideways
	if Input.is_action_pressed("move_left"):
		rotation -= turn_speed * delta
		lateral_force = Vector2.LEFT.rotated(rotation) * turn_force  # Adds sideways movement

	if Input.is_action_pressed("move_right"):
		rotation += turn_speed * delta
		lateral_force = Vector2.RIGHT.rotated(rotation) * turn_force  # Adds sideways movement

	# Apply forward and lateral movement forces
	apply_central_force(thrust)
	apply_central_force(lateral_force)

	# Limit the speed
	if linear_velocity.length() > max_speed:
		linear_velocity = linear_velocity.normalized() * max_speed

	# Apply friction (gradual slow down when no input)
	linear_velocity *= friction
