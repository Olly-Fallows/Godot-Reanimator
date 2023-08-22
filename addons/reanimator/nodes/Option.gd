class_name Option
extends Resource

@export
var next: NodePath
@export
var drivers: Array[Driver]

func check(d):
	for a in len(drivers):
		if drivers[a].name != d[a].name:
			return false
		if drivers[a].value > 0 && drivers[a].value != d[a].value:
			return false
	return true
