extends Node2D

#reinicia o jogo
func _on_button_pressed():
	get_tree().change_scene_to_file("res://race.tscn")
