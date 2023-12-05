extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
var animation_lock = false;
const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if(direction < 0):
			_animated_sprite.set_flip_h(true)
		else:
			_animated_sprite.set_flip_h(false)
		if(not animation_lock):
			_animated_sprite.play("run")
	else:
		if(not animation_lock):
			_animated_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func has_died():
	animation_lock = true;
	_animated_sprite.play("death")

func _on_animated_sprite_2d_animation_finished():
	if(animation_lock):
		print("died screen")		
