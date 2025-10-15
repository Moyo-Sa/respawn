extends Area2D
#for platform to exit game
@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player on Platform")
		Engine.time_scale = 0.5
		await get_tree().create_timer(0.5).timeout
		Engine.time_scale = 1.0
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
