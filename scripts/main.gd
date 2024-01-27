extends Node

@export var bulle_scene: PackedScene
@export var initial_bulle_speed: float

var clicking = false
var player
var wolf

func _ready():
	player = find_child("Player")
	wolf = find_child("Wolf")

	var rect = get_viewport().get_visible_rect()
	var rect_p = rect.position
	var rect_e = rect.end
	wolf.position = Vector2(randf_range(rect_p.x, rect_e.x), randf_range(rect_p.y, rect_e.y))

func _unhandled_input(event):
	if Input.is_action_pressed("mouse_left_click") and clicking == false:
		clicking = true
		var bulle_velocity = Vector2.from_angle(player.position.direction_to(event.position).angle()) * initial_bulle_speed
		var bulle = bulle_scene.instantiate()
		bulle.linear_velocity = bulle_velocity
		bulle.position = player.position
		add_child(bulle)

	if Input.is_action_just_released("mouse_left_click"):
		clicking = false
