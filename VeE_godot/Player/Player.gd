extends Area2D

@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	anim.play("moving")

func _process(delta):
	#movimentação do jogador e animações
	if Input.is_action_pressed("ui_left"):
		anim.play("turn_left")
		position.x -= 7
	elif Input.is_action_pressed("ui_right"):
		anim.play("turn_right")
		position.x += 7
	elif Input.is_action_pressed("ui_up"):
		position.y -= 7
	elif Input.is_action_pressed("ui_down"):
		anim.play("moving")
		position.y += 7
	else:
		anim.play("moving")	
	position.x = clamp(position.x, 140, 1020)
	position.y = clamp(position.y, 90, 680)
