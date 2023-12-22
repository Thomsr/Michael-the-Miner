extends Camera2D

func _on_firstpart_body_entered(body):
	global_position.x = 0

func _on_firstpart_body_exited(body):
	global_position.x = 1920
