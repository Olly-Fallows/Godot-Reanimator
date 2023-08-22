@tool
extends EditorPlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("ReSprite", "Sprite2D", preload("res://addons/reanimator/nodes/ReSprite.gd"), preload("res://icon.svg"))
	add_custom_type("ReAnimation", "Node", preload("res://addons/reanimator/nodes/ReAnimation.gd"), preload("res://icon.svg"))
	add_custom_type("Switch", "Node", preload("res://addons/reanimator/nodes/Switch.gd"), preload("res://icon.svg"))
	
	add_custom_type("Driver", "Resource", preload("res://addons/reanimator/nodes/Driver.gd"), preload("res://icon.svg"))
	add_custom_type("Cell", "Resource", preload("res://addons/reanimator/nodes/Cell.gd"), preload("res://icon.svg"))
	add_custom_type("Option", "Resource", preload("res://addons/reanimator/nodes/Option.gd"), preload("res://icon.svg"))

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("ReSprite")
	remove_custom_type("ReAnimation")
	remove_custom_type("Switch")
	
	remove_custom_type("Driver")
	remove_custom_type("Cell")
	remove_custom_type("Option")
	
