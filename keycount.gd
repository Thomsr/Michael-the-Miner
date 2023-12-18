extends CanvasLayer

var entered = false

func _on_deur_keyscount(keys):
	$gotkey.text = "Keys: " + str(keys)

