extends CSGBox3D

var move = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_all_sounds_in_order()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if move == true:
		position.z += 0.005

func play_all_sounds_in_order():
	await get_tree().create_timer(10.0).timeout
	# lock door
	$door_lock.play()
	
	await get_tree().create_timer(5.0).timeout
	# cutting noise
	$cutting.play()
	
	await get_tree().create_timer(10.0).timeout
	# rummaging
	$rummage.play()
	
	await get_tree().create_timer(30.0).timeout
	# door opens
	$wallMove.play()
	move = true
