extends Area2D


var speed = Global.enemy_speed

func _ready():
	#posição inicial do inimigo
	position.y = -100
	position.x = randf_range(130,1000)

func _process(delta):
	position.y += Global.enemy_speed

#quando passar por 10 inimigos a velocidade aumenta
func _on_race_speed_increased(value):
	speed += value
	print("speed: " +str(speed)) 
