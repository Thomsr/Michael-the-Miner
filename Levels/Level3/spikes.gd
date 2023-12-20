extends Node2D


func _on_out_of_the_world_body_entered(body):
	if body.has_method("die"):
		body.die()

func _on_spike_area_body_entered(body):
	if body.has_method("die"):
		body.die()
