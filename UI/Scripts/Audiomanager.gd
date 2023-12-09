extends Node

#Plays a sound in the sfx audiobus
func play_sound(stream: AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.set_bus(&"sfx")
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.play()

#Deletes the instance of the stream player
func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()
