extends CharacterBody3D

const SPEED = 5.0
const SPRINT_SPEED = 10.0
const JUMP_VELOCITY = 4.5
var is_sprinting = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):

	get_node("topless_guy").rotation.y = atan2(velocity.x,velocity.z) # Rotate the character's mesh based on the direction


				
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
			velocity.z = direction.z * SPRINT_SPEED #We times by sprint speed instead of normal speed if player is press shift
			is_sprinting = true
			get_node("topless_guy/AnimationPlayer").play("Run")
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			get_node("topless_guy/AnimationPlayer").play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		get_node("topless_guy/AnimationPlayer").play("Idle")
		get_node("topless_guy").rotation.y = -160
		
		

	move_and_slide()
