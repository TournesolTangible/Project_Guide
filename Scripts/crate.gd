extends Node3D

@export var mass = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$CrateRigidBody.mass = mass
	var player = get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_node_body_entered(body):
	
	if body.is_in_group("Player"):
		print("Found player")
		$CrateRigidBody.apply_central_impulse(Vector3.UP * 2)
		$CrateRigidBody.apply_central_impulse(Vector3())
