extends State

@export var character_body_2d: CharacterBody2D
@export var animated_body_2d: AnimatedSprite2D

@export_category("Run State")
@export var speed: int = 1000
@export var max_horizontol_speed: int = 300



func enter() -> void:
	animated_body_2d.play("Run")
	
func exit() -> void:
	animated_body_2d.stop()

func process_frame(delta: float):
	var direction:float = GameInputEvents.movement_input()
	if direction:
		character_body_2d.velocity.x += direction * speed
		character_body_2d.velocity.x = clamp(character_body_2d.velocity.x, -max_horizontol_speed, max_horizontol_speed)
		
	if direction != 0:
		animated_body_2d.flip_h = false if direction > 0 else true
	
	character_body_2d.move_and_slide()
	
	if direction == 0:
		transition.emit("Idle")
	
func process_physics(delta: float):
	pass
