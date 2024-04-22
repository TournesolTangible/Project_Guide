extends Node3D

var in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if in_range == true and Input.is_action_just_pressed("lmb"):
		print("key acquired")
		hide()
		var world = get_node("../../..")
		world.get_key()
		process_mode = Node.PROCESS_MODE_DISABLED
		get_node("../../../Player").show_hand()


func _on_key_area_body_entered(body):
	if body.is_in_group("Player"):
		in_range = true
		$key_hand.show()
		get_node("../../../Player").hide_hand()
		print("player in range of key")


func _on_key_area_body_exited(body):
	if body.is_in_group("Player"):
		in_range = false
		$key_hand.hide()
		get_node("../../../Player").show_hand()
		print("player left range of key")
