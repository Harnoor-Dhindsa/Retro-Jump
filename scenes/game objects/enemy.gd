extends RigidBody2D

@onready var game_manager: Node = %GameManager
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx_bounce: AudioStreamPlayer2D = $sfx_bounce
@onready var sfx_hit: AudioStreamPlayer2D = $sfx_hit

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		if (y_delta > 90):
			body.jump()
			sfx_bounce.play()
			animated_sprite_2d.play("destroy")
			await animated_sprite_2d.animation_finished
			queue_free()
		else:
			print("decrease health")
			sfx_hit.play()
			game_manager.decrease_health()
			body.jump()
