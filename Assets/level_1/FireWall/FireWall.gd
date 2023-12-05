extends Area2D
 
 
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		if PlayerItems.HasFireShield == 0:
			body.die()
 
