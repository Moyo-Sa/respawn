extends Area2D

@onready var fire: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $Killzone



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		fire.play('on')
	call_deferred("turn_on") 

#func _on_animated_sprite_2d_ready() -> void:
	#print("Killzone node is: ", killzone) 
	#killzone.disable_mode = CollisionObject2D.DISABLE_MODE_MAKE_STATIC


func turn_on():
	killzone.disable_mode = CollisionObject2D.DISABLE_MODE_REMOVE
	


func _on_ready() -> void:
	killzone.disable_mode = CollisionObject2D.DISABLE_MODE_MAKE_STATIC
