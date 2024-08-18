extends Cutscene

func _ready() -> void:
	damage_amper = DamageAmper.new()
	add_child(damage_amper)

func set_params(player: Entity, target: Entity):
	self.attacker = player
	self.target = target

func play_animation():
	# TODO: Figure out a way to do animations in batlles properly.
	
	var original_position: Vector2 = attacker.position
	var tween: Tween = create_tween()
	tween.tween_property(attacker, "position", target.position, 1)
	tween.play()
	target.health.damage(attacker.current_move.damage)
	tween.tween_property(attacker, "position", original_position, 1)
	tween.play()
	await tween.finished
	queue_free()
