extends Node2D

signal speed_increased(value)

@onready var road = preload("res://road.tscn")
@onready var enemy_car = preload("res://enemy_car.tscn")
@onready var life_label = get_node("Life")
@onready var speed_label = get_node("Speed")
@onready var enemy = $Enemy_car
@onready var crash = $crash
@onready var timer = $Timer
@onready var increased = $increased

var car_timer = 0
var enemy_counter = 0

var time = 74
var lives = 3


func _process(delta):
	time += 1
	car_timer += 1
	#cria inimigos
	if car_timer > 60:
		var ins_car = enemy_car.instantiate()
		car_timer = 0
		enemy_counter+=1
		print("enemy")
		add_child(ins_car)
	#criando o background
	if time > 73:
		var ins_road = road.instantiate()
		add_child(ins_road)
		time = 0
		
	#velocidade maxima de 20 (inicial de 10)
	#mudei de 7-10 para 10-20 por achar que estava muito lento
	if Global.enemy_speed<20:
		if enemy_counter - 10 >=0:
			increased.show()
			timer.start()
			emit_signal("speed_increased", 1)
			Global.enemy_speed+=1
			speed_label.text = str(Global.enemy_speed) + "km/h"
			enemy_counter = 0
			
#detecta colisões e remove uma vida
func _on_p_layer_area_entered(area):
	crash.play()
	lives-=1
	life_label.text =  str(lives)
	#se as vidas chegarem a zero o jogo encerra
	if lives <=0:
		Global.enemy_speed = 10
		enemy_counter = 0
		get_tree().change_scene_to_file("res://game_over.tscn")

#timer para o texto de velocidade aumentada
func _on_timer_timeout():
	increased.hide()
