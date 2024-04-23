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

func preset_for_start_screen():
	set_brightness(2.0)
	set_ghost(5.0)
	set_grid(0.0)
	set_white_noise(0.4)

func preset_for_main_area():
	set_brightness(1.8)
	set_ghost(4.0)
	set_grid(0.0)
	set_white_noise(0.2)
	
func preset_for_windmill():
	set_brightness(2.0)
	set_ghost(5.0)
	set_grid(0.2)
	set_white_noise(0.3)

func play_fade_out():
	$AnimationPlayer.play("FadeOut")

func play_fade_in():
	$AnimationPlayer.play("FadeIn")

func set_brightness(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_brightness", value)

func set_ghost(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_ghost", value)

func set_grid(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_grid", value)

func set_white_noise(value : float):
	$CanvasLayer/CRT.material.set_shader_parameter("crt_white_noise", value)

func static_fade():
	var counter = 0.0
	while $CanvasLayer/CRT.material.get_shader_parameter("crt_white_noise"):
		$CanvasLayer/CRT.material.set_shader_parameter("crt_white_noise", counter)
		$CanvasLayer/CRT.material.set_shader_parameter("crt_ghost", counter*10)
		await get_tree().create_timer(0.01).timeout
		counter += 0.01

func fade_to_black():
	play_fade_out()
	await get_tree().create_timer(5.0).timeout
	$CanvasLayer/Label.show()
