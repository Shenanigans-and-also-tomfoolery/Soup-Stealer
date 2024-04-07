extends CharacterBody3D

const SPEED = 5.0
const SPRINT_SPEED = 10.0
const JUMP_VELOCITY = 4.5
const SPRINT_DURATION = 2.0  # Adjust the duration as needed
const SPRINT_COOLDOWN = 5.0  # Adjust the cooldown time as needed
var sprint_timer = 0.0
var sprint_cooldown_timer = 0.0
var is_sprinting = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):

	if sprint_cooldown_timer > 0:
		sprint_cooldown_timer -= delta
	else:
		if Input.is_action_pressed("sprint") and sprint_timer <= SPRINT_DURATION:
			is_sprinting = true
			sprint_timer += delta
			if sprint_timer > SPRINT_DURATION:
				sprint_timer = SPRINT_DURATION
		else:
			is_sprinting = false
			sprint_timer = 0.0
			if sprint_cooldown_timer <= 0.0:
				sprint_cooldown_timer = SPRINT_COOLDOWN
				
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if Input.is_action_pressed("sprint"):
			velocity.x = direction.x * SPRINT_SPEED
			velocity.z = direction.z * SPRINT_SPEED
			is_sprinting = true
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
