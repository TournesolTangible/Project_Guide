extends CharacterBody3D

@onready var head = $Head

@export var current_speed = 5.0
const WALK_SPEED = 3.0
const SPRINT_SPEED = 5.0
const JUMP_VELOCITY = 4.0

const MOUSE_SENS = 0.1

var lerp_speed = 10.0

var direction = Vector3.ZERO

var can_progress_into_windmill = false

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
		
#	if Input.is_action_pressed("lmb"):
#		$interaction_collider.disabled = true
#	else:
#		$interaction_collider.disabled = false

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
	
	if Input.is_action_pressed("rmb"):
		set_hand_thumb()
	else:
		set_hand_point()
	
	if Input.is_action_just_pressed("lmb") and can_progress_into_windmill == true:
		$Windmill_door_open.play()
		get_node("../..").load_scene("res://Scenes/windmill_interior.tscn")
		

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

func set_hand_thumb():
	$Head/hand.set_hand_thumb()

func _on_windmill_area_body_entered(body):
	if body.is_in_group("Player"):
		var textnode = get_node("../Env/windmill/windmill_text")
		
		hide_hand()
		if get_node("../").has_key() == true:
			get_node("../Env/windmill/knob/knob_hand").show()
			get_node("../Env/windmill/knob/knob_hand/Key_model").show()
			can_progress_into_windmill = true
		else:
			get_node("../Env/windmill/knob/knob_hand").show()
			get_node("../Env/windmill/knob/knob_hand/Key_model").hide()

		

func _on_windmill_area_body_exited(body):
	if body.is_in_group("Player"):
		var textnode = get_node("../Env/windmill/windmill_text")
		# textnode.hide()
		
		show_hand()
		get_node("../Env/windmill/knob/knob_hand").hide()
		
