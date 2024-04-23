extends Node3D

@export var bubble_pitch : float = 1.0
@export var text_to_display : String
@export var time = 0.0
@export var freq = 1.0
@export var amp = 0.01

var breakable = false
var broken = false


func _ready():
	$text.text = text_to_display
	if bubble_pitch == 1.0:
		$BubblePop.pitch_scale = randf_range(0.5, 1.5)
	else:
		# bubble_pitch defined in inspector
		pass
	
	position.y += randf_range(-0.5, 0.5)
	

func _process(delta):
	
	if breakable == true && Input.is_action_just_pressed("lmb") && broken == false:
		broken = true
		$BubblePop.play()
		await get_tree().create_timer(2.0).timeout
		get_node("../../Player").show_hand()
		$hand.hide()
		
	
	if broken == false:
		time += delta
		position.y += sin(time * freq) * amp
	else:
		$Sketchfab_model.hide()
		$text.show()
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_node("../../Player").hide_hand()
		$hand.show()
		breakable = true
		


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_node("../../Player").show_hand()
		$hand.hide()
		breakable = false
