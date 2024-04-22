extends Node3D


func _physics_process(delta):
	
#	if Input.is_action_pressed("lmb"):
#
#		rotate_x(-deg_to_rad(5))
#
#	if Input.is_action_pressed("rmb"):
#		rotate_x(deg_to_rad(5))
	
#	if Input.is_action_pressed("lmb"):
#		scale += Vector3(1, 1, 1)
#
#	if Input.is_action_pressed("rmb"):
#		scale -= Vector3(1, 1, 1)

	pass

func set_hand_open():
	$R_Hard_Point1.hide()
	$R_Hard_Paper.show()
	$R_Thumb.hide()

func set_hand_point():
	$R_Hard_Point1.show()
	$R_Hard_Paper.hide()
	$R_Thumb.hide()

func set_hand_thumb():
	$R_Hard_Point1.hide()
	$R_Thumb.show()
