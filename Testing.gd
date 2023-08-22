extends Node2D

func _input(event):
	if event.is_action_pressed("walk"):
		$ReSprite.add_driver("is_moving", -1)
	if event.is_action_pressed("idle"):
		pass
	if event.is_action_released("walk"):
		$ReSprite.remove_driver("is_moving")
	if event.is_action_pressed("idle"):
		pass
