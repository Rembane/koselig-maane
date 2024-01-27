extends CharacterBody2D

func _ready():
	var screen_size = get_viewport_rect().size
	position = Vector2(0, screen_size.y)

func _process(delta):
	pass
