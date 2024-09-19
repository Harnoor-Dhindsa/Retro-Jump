extends Node

@onready var hover: AudioStreamPlayer = $hover



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_back_mouse_entered() -> void:
	hover.play()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/option_menu.tscn")


func _on_options_mouse_entered() -> void:
	hover.play()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")


func _on_level_1_mouse_entered() -> void:
	hover.play()


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")


func _on_level_2_mouse_entered() -> void:
	hover.play()


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level3.tscn")


func _on_level_3_mouse_entered() -> void:
	hover.play()
	
func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level4.tscn")

func _on_level_4_mouse_entered() -> void:
	hover.play()
