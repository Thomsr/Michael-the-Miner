extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	if DisplayServer.window_get_mode() == 3:
		self.button_pressed = true
	else:
		self.button_pressed = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
