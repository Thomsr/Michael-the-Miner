extends Control

#Variable for global audio manager
@export var stream: AudioStream

#Go back to main menu
func _on_go_back_button_pressed():
	Audiomanager.play_sound(stream)
	get_tree().change_scene_to_file("res://UI/Scenes/MainMenu.tscn")

#Fullscreen toggle
func _on_screen_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


