extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump
@onready var sfx_walk: AudioStreamPlayer2D = $sfx_walk



func jump():
	velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		if velocity.y > 0:
			sprite_2d.animation = "falling"
		else:
			sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		sfx_jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			if !sfx_walk.playing:
				sfx_walk.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sfx_walk.stop()

	move_and_slide()
	
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
