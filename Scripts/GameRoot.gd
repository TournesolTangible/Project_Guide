extends Node

var currentScene
var currentSceneInstance

@export var scene1 : String
@export var scene2 : String
@export var scene3 : String



func _ready():
	
	# Load new scene, instatiate, add to root
	currentScene = load(scene1)
	var currentSceneInstance = currentScene.instantiate()
	add_child(currentSceneInstance)
	move_child(currentSceneInstance, 0)
	
	# Fade in
	
	$FadeNode/AnimationPlayer.play("FadeIn")

	
#	# Remove child[0] - this should always be the current scene
#	get_child(0).queue_free()
#	remove_child(get_child(0))
	
#	# Add new scene as child[0]
#	add_child(next_level)
#	move_child(next_level, 0)

func _process(delta):
	
	if Input.is_action_just_pressed("esc"):
		fade_and_exit()

func start_game():
	$FadeNode.play_fade_in()
	load_scene(scene2)

func load_scene(scene : String):
	
	var new_scene_instance = load(scene).instantiate()
	
	$FadeNode.play_fade_out()
	await get_tree().create_timer(2.0).timeout
	
	get_child(0).queue_free()
	remove_child(get_child(0))
	
	add_child(new_scene_instance)
	move_child(new_scene_instance, 0)
	
	$FadeNode.play_fade_in()

func fade_and_exit():
	$FadeNode.play_fade_out()
	await get_tree().create_timer(2.0).timeout
	get_tree().quit()
