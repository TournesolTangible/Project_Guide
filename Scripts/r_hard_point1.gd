extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("lmb"):
		
		rotate_x(-deg_to_rad(5))
		
	if Input.is_action_pressed("rmb"):
		rotate_x(deg_to_rad(5))
