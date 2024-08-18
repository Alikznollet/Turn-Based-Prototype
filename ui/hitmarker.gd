extends TextureRect
class_name Hitmarker

func _ready() -> void:
	visible = false

func show_hitmarker(update: HealthUpdate):
	visible = true
	# TODO: Implement different visual for heal/damage
	$CenterContainer/Label.text = str(update.health_change)
	$Timer.start()
	

func _on_timer_timeout() -> void:
	visible = false
