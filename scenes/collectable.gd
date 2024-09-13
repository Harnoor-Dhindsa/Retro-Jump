extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animated_sprite_2d.play("collected")
		await animated_sprite_2d.animation_finished
		game_manager.add_point()
		queue_free()
		
