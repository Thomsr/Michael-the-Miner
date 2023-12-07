extends Camera2D

@export var Player: CharacterBody2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Player.global_position.y < 1080 - 16):
		global_position.y = -1080.0;
	else:
		global_position.y = 0.0;
		
