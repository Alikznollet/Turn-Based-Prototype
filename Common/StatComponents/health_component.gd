extends Node
class_name HealthComponent

signal healthChanged(health_update: HealthUpdate)
signal died()

@export var MAX_HEALTH: int

var current_health_percent: float
var has_health_remaining: bool
var current_health: int:
	get:
		return current_health
	set(newValue):
		var previous_health = current_health
		current_health = min(newValue, MAX_HEALTH)
		current_health_percent = current_health / MAX_HEALTH
		has_health_remaining = not is_equal_approx(current_health, 0.0)
		var health_update: HealthUpdate = HealthUpdate.new(
			previous_health,
			current_health,
			MAX_HEALTH,
			current_health_percent,
			previous_health <= current_health
		)
		healthChanged.emit(health_update)
		if not has_health_remaining and not has_died:
			has_died = true
			died.emit()
		
var has_died: bool = false

func _ready():
	current_health = MAX_HEALTH
	has_health_remaining = true
	current_health_percent = 1
	
func damage(damage_done: int):
	current_health -= damage_done

func heal(heal_given: int):
	damage(-heal_given)
