extends CharacterBody2D

@export
var SPEED = 5000

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

func _process(delta):
	var playerInput = get_input()
	velocity = playerInput * SPEED * delta
	move_and_slide()
