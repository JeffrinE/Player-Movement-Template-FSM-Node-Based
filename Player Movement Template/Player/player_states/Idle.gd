extends State

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

@export_category("Friction")
@export var slow_down_speed: int = 1700

func enter() -> void:
	animated_sprite_2d.play("Idle")
	
func exit() -> void:
	animated_sprite_2d.stop()

func process_frame(delta: float):
	pass
	
func process_physics(delta: float):
	character_body_2d.velocity.x = move_toward(character_body_2d.velocity.x, 0, slow_down_speed)
	#run state
	var direction = GameInputEvents.movement_input()
	if direction:
		transition.emit("Run")
	

