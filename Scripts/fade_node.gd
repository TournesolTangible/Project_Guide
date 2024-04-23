extends Control

var c = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	if Input.is_action_just_released("lmb"):
#
#		set_brightness(c)
#		c += 1
	pass
		

func play_fade_out():
	$AnimationPlayer.play("FadeOut")

func play_fade_in():
	$AnimationPlayer.play("FadeIn")

func set_static(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_white_noise", value)

func set_ghost(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_ghost", value)

func set_brightness(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_brightness", value)
	
	
