extends CharacterBody2D

@export var walking_speed_multiplier : int
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var walking_speed = 0

func _physics_process(delta):
	velocity = Vector2(walking_speed, gravity) * delta
	move_and_slide()

func _unhandled_key_input(_event):
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
