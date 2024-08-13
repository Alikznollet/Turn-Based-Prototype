extends Node2D

var player: Entity
var target: Entity

func set_params(player: Entity, target: Entity):
	self.player = player
	self.target = target

func play_animation():
	var original_position: Vector2 = player.position
	var tween: Tween = create_tween()
	tween.tween_property(player, "position", target.position, 1)
	tween.play()
	tween.tween_property(player, "position", original_position, 1)
	tween.play()
	await tween.finished
	queue_free()
