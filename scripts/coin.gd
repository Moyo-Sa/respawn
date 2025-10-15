extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _on_body_entered(body: Node2D) -> void:
	print("One coin passed")
	animation_player.play("pickup") # play sound
	GameManager.add_point()
	
