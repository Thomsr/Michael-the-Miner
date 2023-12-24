extends Area2D
 
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		queue_free()
		PlayerItems.HasFireShield = true
		$"../Player/FireImmunity".visible = true
