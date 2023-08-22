class_name Switch
extends Node

@export
var conditions: Array[Driver]

func select(drivers):
	var highest = null
	var highest_val = -1
	for o in get_children():
		if "conditions" in o:
			var val = check(drivers, o.conditions)
			if val > highest_val:
				highest = o
				highest_val = val
	return highest

func check(d, con):
	var a = -1
	if len(con) == 0:
		return 0
	for c in con:
		if check_con(c, d):
			a = max(1, a+1)
	return a

func check_con(condition: Driver, drivers: Array[Driver]):
	for d in drivers:
		if condition.name == d.name:
			if condition.value < 0:
				return true
			if condition.value == d.value:
				return true
	return false
