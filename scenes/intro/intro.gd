extends Node

@onready var fade: AnimationPlayer = $fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade.play("fade_in")
	await get_tree().create_timer(6).timeout
	fade.play("fade_out")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
