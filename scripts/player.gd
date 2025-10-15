extends CharacterBody2D

@onready var player: AnimatedSprite2D = $AnimatedSprite2D
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var healthbar: ProgressBar = $Health
@onready var damage_amount: int = 25

var current_health
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var is_dead: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#player process function
func _physics_process(delta):
	# Add the velocity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle the jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	
	#handle flipping sprite image
	if direction > 0:
		player.flip_h = false
	elif direction < 0:
		player.flip_h = true
	
	#handle sprite animation
	#handle animation for player when alive
	if not is_dead:
		if is_on_floor():
			if direction == 0:
				player.play("idle")
			else:
				player.play("run")
		else:
			player.play("jump")
	
	
	#handle speed
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#on ready to initialize player's health
func _on_ready() -> void:
	GameManager.max_health = 100
	

#function for adjusting healthbar and player's health
func player_damage():
	GameManager.set_health(GameManager.current_health - damage_amount)
	

#function for dying 
func die():
	if is_dead:
		return
	
	is_dead = true
	death_sound.play()
	player.play("die")
	print("Player dies")	


	
