extends CharacterBody2D

func _ready():
	var screen_size = get_viewport_rect().size
	var collision_size = find_child("CollisionShape2D").get_shape().get_rect().size
	position = Vector2(collision_size.x / 2, screen_size.y - collision_size.y / 2)

func _process(delta):
	pass
