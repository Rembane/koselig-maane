extends Node

@export var bulle_scene: PackedScene
@export var initial_bulle_speed: float

var clicking = false
var player

func _ready():
	player = find_child("Player")

func _unhandled_input(event):
	if Input.is_action_pressed("mouse_left_click") and clicking == false:
		clicking = true
		var bulle_velocity = Vector2.from_angle(player.position.direction_to(event.position).angle()) * initial_bulle_speed
		var bulle = bulle_scene.instantiate()
		bulle.linear_velocity = bulle_velocity
		bulle.position = event.position
		add_child(bulle)

	if Input.is_action_just_released("mouse_left_click"):
		clicking = false
