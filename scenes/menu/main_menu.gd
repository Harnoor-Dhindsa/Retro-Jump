extends Node
@onready var hover: AudioStreamPlayer = $hover
@onready var bg: AudioStreamPlayer = $bg



func _on_start_mouse_entered() -> void:
	hover.play()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")


func _on_options_mouse_entered() -> void:
	hover.play()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/option_menu.tscn")


func _on_levels_mouse_entered() -> void:
	hover.play()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/level_menu.tscn")

func _on_volume_toggled(toggled_on: bool) -> void:
	if (toggled_on == true):
		bg.play()
	else:
		bg.stop()

	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_quit_mouse_entered() -> void:
	hover.play()
