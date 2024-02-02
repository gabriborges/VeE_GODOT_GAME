extends Sprite2D

func _ready():
	#posição inicial da estrada
	position.y = -360

func _process(delta):
	position.y += 6
	if position.y > 1081:
		queue_free()
