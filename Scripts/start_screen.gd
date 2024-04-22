extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_node("..").start_game()
	$start.disabled = true
	$start2.disabled = true
	$ButtonPress.play()


func _on_start_2_pressed():
	get_node("..").fade_and_exit()
	$start.disabled = true
	$start2.disabled = true
	$ButtonPress.play()
