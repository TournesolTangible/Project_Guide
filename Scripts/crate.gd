extends Node3D

@export var mass = 1.0
var throwable = false
var tp

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$CrateRigidBody.mass = mass
	var player = get_node("Player")
	tp = get_node("../../../../throwpoint")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if throwable == true && Input.is_action_just_pressed("lmb"):
		$CrateRigidBody.apply_central_impulse(tp.position)
		$BoxHit.pitch_scale = randf_range(0.8, 1.1)
		$BoxHit.play()


func _on_area_node_body_entered(body):
	if body.is_in_group("Player"):
		print("player entered")
		throwable = true

func _on_area_node_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		throwable = false
