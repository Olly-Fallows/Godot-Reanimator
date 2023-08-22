extends Node2D

func _input(event):
	if event.is_action_pressed("run"):
		$ReSprite.add_driver("is_running", -1)
	if event.is_action_pressed("walk"):
		$ReSprite.add_driver("is_walking", -1)
	if event.is_action_pressed("idle"):
		pass
	if event.is_action_released("run"):
		$ReSprite.remove_driver("is_running")
	if event.is_action_released("walk"):
		$ReSprite.remove_driver("is_walking")
	if event.is_action_pressed("idle"):
		pass
