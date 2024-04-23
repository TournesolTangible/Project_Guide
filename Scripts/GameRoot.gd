extends Node

var currentScene
var currentSceneInstance

@export var scene1 : String # Start screen
@export var scene2 : String # First windmill area
@export var scene3 : String # Windmill interior



func _ready():
	
	# Load new scene, instatiate, add to root
	currentScene = load(scene1)
	var currentSceneInstance = currentScene.instantiate()
	add_child(currentSceneInstance)
	move_child(currentSceneInstance, 0)
	
	# Fade in
	
	$FadeNode/AnimationPlayer.play("FadeIn")

func _process(delta):
	
	if Input.is_action_just_pressed("esc"):
		fade_and_exit()

func start_game():
	$FadeNode.play_fade_in()
	var new_scene_instance = load(scene2).instantiate()
	
	$FadeNode.play_fade_out()
	await get_tree().create_timer(2.0).timeout
	$FadeNode.set_static(0.0)
	$FadeNode.set_ghost(2.0)
	
	get_child(0).queue_free()
	remove_child(get_child(0))
	
	add_child(new_scene_instance)
	move_child(new_scene_instance, 0)
	
	$FadeNode.play_fade_in()

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
