class_name Driver
extends Resource

@export
var name: String
@export 
var value: int

func _init(n="", v=-1):
	name = n
	value = v
