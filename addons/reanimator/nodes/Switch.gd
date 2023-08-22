class_name Switch
extends Node

@export
var conditions: Array[Driver]

func select(drivers):
	for o in get_children():
		if "conditions" in o:
			if check(drivers, o.conditions):
				return o

func check(d, con):
	if len(d) != len(con):
		return false
	for c in con:
		if not check_con(c, d):
			return false
	return true

func check_con(condition: Driver, drivers: Array[Driver]):
	for d in drivers:
		if condition.name == d.name:
			if condition.value < 0:
				return true
			if condition.value == d.value:
				return true
	return false
