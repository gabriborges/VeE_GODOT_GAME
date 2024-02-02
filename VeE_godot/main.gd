extends Node2D

func _ready():
	pass 

func _process(delta):
	pass

#botão inciar
func _on_play_pressed():
	get_tree().change_scene_to_file("res://race.tscn")

#botão sair
func _on_quit_pressed():
	get_tree().quit()
