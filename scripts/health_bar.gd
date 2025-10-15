extends ProgressBar

@onready var damage: ProgressBar = $Damage
@onready var timer: Timer = $Timer


func update_health_UI(new_health):
	var prev_health = value
	value = min(max_value, new_health)
	
	value = new_health
	
	if new_health < prev_health:
		timer.start()
	else:
		damage.value = new_health

func _on_timer_timeout() -> void:
	damage.value = value


func _on_ready() -> void:
	max_value = GameManager.max_health
	value = GameManager.current_health
	damage.max_value = GameManager.max_health
	damage.value = GameManager.current_health
	GameManager.health_updated.connect(update_health_UI)
