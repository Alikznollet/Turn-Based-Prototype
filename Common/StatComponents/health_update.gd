extends Node
class_name HealthUpdate

var previous_health: int
var current_health: int
var MAX_HEALTH: int
var current_health_percent: float
var heal: bool

func _init(previous_health: int, current_health: int, max_health: int,
 health_percent: float, heal: bool):
	self.previous_health = previous_health
	self.current_health = current_health
	self.MAX_HEALTH = max_health
	self.current_health_percent = health_percent
	self.heal = heal
	
