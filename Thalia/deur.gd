extends Area2D

var haskey1 = false
var haskey2 = false
var haskey3 = false
var keys = 0

@onready var KEY1 = $"../Keys/key"
@onready var KEY2 = $"../Keys/key2"
@onready var KEY3 = $"../Keys/key3"

signal keyscount

func _on_key_body_entered(body):
	if haskey1 == false:
		haskey1 = true
		KEY1.visible = false
		keys = keys + 1
		keyscount.emit(keys)

func _on_key_2_body_entered(body):
	if haskey2 == false:
		haskey2 = true
		KEY2.visible = false
		keys = keys + 1
		keyscount.emit(keys)


func _on_key_3_body_entered(body):
	if haskey3 == false:
		haskey3 = true
		KEY3.visible = false
		keys = keys + 1
		keyscount.emit(keys)

#Let op signals.
func _on_body_entered(body: Node2D) -> void:
	if (haskey1 == true && haskey2 == true && haskey3 == true):
		if body.has_method("die"):
			get_tree().change_scene_to_file("res://UI/Scenes/EndScreen.tscn")
 
