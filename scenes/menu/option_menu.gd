extends Node

@onready var hover: AudioStreamPlayer = $hover
@onready var win_option: OptionButton = $UI/graphics/winOption
@onready var res_option: OptionButton = $UI/graphics/resOption
@onready var controls: Panel = $UI/controls
@onready var graphics: Panel = $UI/graphics
@onready var sound: Panel = $UI/sound


func _on_levels_mouse_entered() -> void:
	hover.play()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/level_menu.tscn")


func _on_back_mouse_entered() -> void:
	hover.play()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
	
const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full-Screen"
]

const RESOLUTION_DICTIONARY: Dictionary = {
	"800 x 600": Vector2i(800, 600),
	"1152 x 648": Vector2i(1152, 648),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080),
}

func _ready() -> void:
	add_window_mode_items()
	add_resolution_items()
	win_option.item_selected.connect(on_window_mode_selected)
	res_option.item_selected.connect(on_resolution_selected)

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		win_option.add_item(window_mode)
	
func add_resolution_items() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		res_option.add_item(resolution_size_text)
		
func on_resolution_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	
func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless Full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)
	
	
func _on_graphic_mouse_entered() -> void:
	hover.play()


func _on_control_mouse_entered() -> void:
	hover.play()


func _on_sound_mouse_entered() -> void:
	hover.play()


func _on_graphic_pressed() -> void:
	graphics.show()
	sound.hide()
	controls.hide()


func _on_control_pressed() -> void:
	graphics.hide()
	sound.hide()
	controls.show()


func _on_sound_pressed() -> void:
	graphics.hide()
	sound.show()
	controls.hide()
