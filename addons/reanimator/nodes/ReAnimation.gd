class_name ReAnimation
extends Node

@export
var conditions: Array[Driver]
@export
var auto_increment = true
@export
var cells: Array[Cell]

func _ready():
	if auto_increment:
		for c in len(cells):
			cells[c].conditions.append(Driver.new(aiName(), c))

func get_cell(drivers):
	if auto_increment:
		increment(drivers)
	var highest = null
	var highest_val = -2
	for c in cells:
		var val = check(drivers, c.conditions)
		if val > highest_val:
			highest = c
			highest_val = val
	return highest

func increment(drivers):
	for d in drivers:
		if d.name == aiName():
			d.value = d.value+1
			if d.value >= len(cells):
				d.value = 0
			return
	drivers.append(Driver.new(aiName(), 0))
	
func check(d, con):
	var a = -1
	if len(con) == 0:
		return 0
	for c in con:
		if check_con(c, d):
			a += 1
	return a

func check_con(condition: Driver, drivers: Array[Driver]):
	for d in drivers:
		if condition.name == d.name:
			if condition.value < 0:
				return true
			if condition.value == d.value:
				return true
	return false

func cleanup(drivers):
	for d in len(drivers):
		if drivers[d].name == name:
			drivers.remove_at(aiName())
			return
			
func aiName():
	return self.to_string()+"_ai"
