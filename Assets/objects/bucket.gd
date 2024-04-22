extends Node3D

var in_range = false
var got_bucket = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if got_bucket == false:
		if in_range == true:
			if Input.is_action_just_pressed("lmb"):
				$pickup.play()
				get_node("../../Player").show_hand()
				hide()
				got_bucket = true


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		if has_bucket() == false:
			body.hide_hand()
		$hand.show()
		in_range = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("Player"):
		body.show_hand()
		$hand.hide()
		in_range = false

func has_bucket():
	return got_bucket

