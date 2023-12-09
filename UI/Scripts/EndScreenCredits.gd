extends Control

#Variable for global audio manager
@export var stream: AudioStream
#Michael sprite looked weird -> project settings -> 
#rendering -> textures -> default texture filter to nearest

func _on_go_back_button_pressed():
	Audiomanager.play_sound(stream)
	get_tree().change_scene_to_file("res://UI/Scenes/MainMenu.tscn")
