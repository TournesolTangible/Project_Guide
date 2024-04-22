extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_fade_out():
	$AnimationPlayer.play("FadeOut")

func play_fade_in():
	$AnimationPlayer.play("FadeIn")
