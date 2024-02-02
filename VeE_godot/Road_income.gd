extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#posição inicial da estrada de overlap
	position.y += 6
	if position.y > 1081:
		queue_free()
