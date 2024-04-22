extends Node3D

var player_has_key = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_key():
	player_has_key = true
	$collect_key.play()
	print(player_has_key)

func has_key():
	return player_has_key
	
# a simple 'hello world'
