extends Area2D
@onready var gameover: AudioStreamPlayer2D = $gameover

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		gameover.play()
		await gameover.finished
		get_tree().reload_current_scene()
