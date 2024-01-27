extends CharacterBody2D

@export var walking_speed_multiplier : int

var walking_speed = 0

func _ready():
	var screen_size = get_viewport_rect().size
	var collision_size = find_child("CollisionShape2D").get_shape().get_rect().size
	position = Vector2(collision_size.x / 2, screen_size.y - collision_size.y / 2)

func _process(delta):
	if walking_speed != 0:
		position.x += walking_speed

func _unhandled_key_input(event):
	if Input.is_action_pressed("walk_left"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walking")
		walking_speed = -1 * walking_speed_multiplier

	if Input.is_action_pressed("walk_right"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walking")
		walking_speed = 1 * walking_speed_multiplier

	if Input.is_action_just_released("walk_left"):
		$AnimatedSprite2D.stop()
		walking_speed = 0
	if Input.is_action_just_released("walk_right"):
		$AnimatedSprite2D.stop()
		walking_speed = 0
