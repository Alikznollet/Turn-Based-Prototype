extends Cutscene

func _ready() -> void:
	damage_amper = DamageAmper.new()
	add_child(damage_amper)

func set_params(player: Entity, target: Entity):
	self.attacker = player
	self.target = target

func play_animation():
	var original_position: Vector2 = attacker.position
	var tween: Tween = create_tween()
	tween.tween_property(attacker, "position", target.position, 1)
	tween.play()
	tween.tween_property(attacker, "position", original_position, 1)
	tween.play()
	await tween.finished
	queue_free()
