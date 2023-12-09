extends HSlider

@export var stream: AudioStream

#Determines the audiobus necessary for the slider
@export var bus_name: String
var bus_index: int
var i = 0

#Determine where bus is and connect a new value
func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
	#Necessary so that a pause menu can also reference 
	#accurate data of options screen
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

#Value of audio bus is changed
func _on_value_changed(value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
	#Test new audio of clicksound
	#With the if statement it should skip playing
	#initialisation sound -_-
	if i >= 1:
		Audiomanager.play_sound(stream)
	i = i + 1
