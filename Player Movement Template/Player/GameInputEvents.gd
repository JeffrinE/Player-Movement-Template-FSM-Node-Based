class_name GameInputEvents
extends Node

static func movement_input() -> float:
	var direction = Input.get_axis("move_left", "move_right")
	return direction
	
static func attack_input()  -> bool:
	var attack_input = Input.is_action_just_pressed("attack")
	return attack_input()
	

