extends AudioStreamPlayer

func _ready():           
	set_process(true)

#Ensures background keeps playing
func _process(delta): 
	if not is_playing():
		play()
