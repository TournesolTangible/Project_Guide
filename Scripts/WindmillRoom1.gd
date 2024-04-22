extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_windmill_door_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_node("../../Player").hide_hand()
		$NoGoHands.show()


func _on_windmill_door_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_node("../../Player").show_hand()
		$NoGoHands.hide()
