extends Camera2D

var entered = false



func _on_firstpart_body_entered(body):
	entered = true


func _on_firstpart_body_exited(body):
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		global_position.x = 900.0
		global_position.y = 500.0
	else:
		global_position.x = 2875.0
		global_position.y = 600.0


