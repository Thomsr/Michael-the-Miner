extends Control

#Variable for global audio manager
@export var stream: AudioStream

func _ready():
	pass

#Pressed the quit button
func _on_quit_button_pressed():
	Audiomanager.play_sound(stream)
	$ConfirmationDialog.visible = true

#Pressed confirm after the quit button
func _on_confirmation_dialog_confirmed():
	get_tree().quit()

#Starting the game
func _on_play_button_pressed():
	Audiomanager.play_sound(stream)
	PlayerItems.HasFireShield = false
	PlayerItems.HasHelmet = false
	get_tree().change_scene_to_file("res://Levels/Level1/level_1.tscn")

#Going to options screen
func _on_options_button_pressed():
	Audiomanager.play_sound(stream)
	get_tree().change_scene_to_file("res://UI/Scenes/Options.tscn")

#Going to credits screen
func _on_credits_button_pressed():
	Audiomanager.play_sound(stream)
	get_tree().change_scene_to_file("res://UI/Scenes/Credits.tscn")
