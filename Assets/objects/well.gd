extends Node3D

var has_bucket = false
var in_range_has_bucket = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var world = get_node("../..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if get_node("../..").has_key() == false:
		if in_range_has_bucket == true and Input.is_action_just_released("lmb"):
			$watersplash.play()
			$Bucket_model.hide()
			$Bucket_model.process_mode = Node.PROCESS_MODE_DISABLED
			$Key.process_mode = Node.PROCESS_MODE_INHERIT
			$Key.show()


func _on_well_area_body_entered(body):
	
	print("player in range of well")
	
	if body.is_in_group("Player") and player_has_bucket() == true:
		in_range_has_bucket = true
		get_node("../../Player").hide_hand()
		$Bucket_model.show()
		print("in range of well and has bucket")

func player_has_bucket():
	return get_node("../bucket").has_bucket()


func _on_well_area_body_exited(body):
	
	print("player exited")
	
	in_range_has_bucket = false
	get_node("../../Player").show_hand()
	$Bucket_model.hide()
