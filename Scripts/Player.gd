extends CharacterBody3D

@onready var head = $Head

@export var current_speed = 5.0
const WALK_SPEED = 3.0
const SPRINT_SPEED = 5.0
const JUMP_VELOCITY = 4.5

const MOUSE_SENS = 0.1

var lerp_speed = 10.0

var direction = Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var hasKey = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		
		# To clamp head - prevent rotation 360 degrees
		# head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89)

func _physics_process(delta):
	
	if Input.is_action_pressed("sprint"):
		current_speed = SPRINT_SPEED
	else:
		current_speed = WALK_SPEED
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerp_speed)
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()

func get_key():
	hasKey = true
func lose_key():
	hasKey = false

func set_hand_open():
	$Head/hand.set_hand_open()

func set_hand_point():
	$Head/hand.set_hand_point()

func hide_hand():
	$Head/hand.hide()
func show_hand():
	$Head/hand.show()

func _on_windmill_area_body_entered(body):
	if body.is_in_group("Player"):
		var textnode = get_node("../Stage/windmill/windmill_text")
		textnode.show()
		
		hide_hand()
		var knob_hand = get_node("../Stage/windmill/knob/knob_hand")
		knob_hand.show()
		
		

func _on_windmill_area_body_exited(body):
	if body.is_in_group("Player"):
		var textnode = get_node("../Stage/windmill/windmill_text")
		textnode.hide()
		
		show_hand()
		var knob_hand = get_node("../Stage/windmill/knob/knob_hand")
		knob_hand.hide()
		

