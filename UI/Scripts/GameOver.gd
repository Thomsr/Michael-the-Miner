extends Control

#Variable for global audio manager
@export var stream: AudioStream

func _on_new_game_button_pressed():
	Audiomanager.play_sound(stream)
	self.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_go_back_button_pressed():
	Audiomanager.play_sound(stream)
	self.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/Scenes/MainMenu.tscn")

