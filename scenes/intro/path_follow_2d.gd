extends PathFollow2D
@onready var sfx_crow: AudioStreamPlayer2D = $AnimatedSprite2D/sfx_crow

var speed = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta * speed
