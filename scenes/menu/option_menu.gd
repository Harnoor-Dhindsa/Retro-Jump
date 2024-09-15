extends Node

@onready var hover: AudioStreamPlayer = $hover





func _on_levels_mouse_entered() -> void:
	hover.play()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/level_menu.tscn")


func _on_back_mouse_entered() -> void:
	hover.play()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
