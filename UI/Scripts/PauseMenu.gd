extends Control
#This is an overlay screen, it "should" show the 
#game as a background
#Mode needs to be "Always" so that the scene is always loaded
#Even when the rest of the tree is paused

#Variable for global audio manager
@export var stream: AudioStream

@onready var Home = $PauseHome
@onready var Options = $PauseOptions
@onready var SoundSlider = $PauseOptions/VBoxContainer/HorizontalOptions/VAudio/EffectsSlider
var paused = false

#Checks if escape is hit
func _process(delta):
	#Escape is a control set in Project Settings -> Input map
	if Input.is_action_just_pressed("Escape"):
		get_tree().paused = true
		pauseMenu()

#Using escape to pause and unpause
func pauseMenu():
	if paused:
		Home.visible = true
		Options.visible = false
		self.hide()
		get_tree().paused = false
	else:
		self.show()
	paused = !paused

#Resume to unpause
func _on_resume_button_pressed():
	Audiomanager.play_sound(stream)
	paused = !paused
	self.visible = false
	get_tree().paused = false

#From pause menu to options
func _on_options_button_pressed():
	Audiomanager.play_sound(stream)
	Home.visible = !Home.visible
	Options.visible = !Options.visible

#From options menu to pause
func _on_go_back_to_pause_pressed():
	Audiomanager.play_sound(stream)
	Home.visible = !Home.visible
	Options.visible = !Options.visible

#From pause to main menu
func _on_go_back_button_pressed():
	Audiomanager.play_sound(stream)
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/Scenes/MainMenu.tscn")

#Fullscreen toggle
func _on_screen_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
#SCRIPTS IM TOO AFRAID TO THROW AWAY
#Use ctrl + k to un comment the script block
#Script necessary for in actual scene to pause the scene
#PauseMenu needs to be a child for each level
#
#variable for pause scene in the current scene
#@onready var PauseMenu = $PauseMenu/PauseHome
#@onready var PauseOptions = $PauseMenu/PauseOptions
#var paused = false
#
#func _process(delta):
#	PauseGame is a control set in Project Settings -> Input map
#	if Input.is_action_just_pressed("PauseGame"):
#		pauseMenu()
#
#menu hides and shows are inverted as originally
#pausemenu is hidden
#func pauseMenu():
#	if paused:
#		PauseMenu.hide()
#		Engine.time_scale = 1
#	else:
#		PauseMenu.show()
#		Engine.time_scale = 0
#	paused = !paused


