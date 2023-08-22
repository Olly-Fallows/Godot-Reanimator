class_name ReSprite
extends Node

@export
var fps: int = 1

@onready
var root = (get_child(0) as Switch)

var ticker: Timer

@export
var drivers: Array[Driver]

func _ready():
	ticker = Timer.new()
	ticker.wait_time = 1/fps
	ticker.timeout.connect(func():
		resolve_tree()
	)
	ticker.autostart = true
	add_child(ticker)
	print(ticker)

func add_driver(name, value):
	for d in drivers:
		if d.name == name:
			d.value = value
			return
	drivers.append(Driver.new(name, value))
	print(drivers)

func remove_driver(name):
	for d in len(drivers):
		print(drivers[d].name)
		if drivers[d].name == name:
			drivers.remove_at(d)
			print("Removed: ", d)
			return

func resolve_tree():
	print(get_next(root))
	
func get_next(switch: Switch):
	var r = switch.select(drivers)
	if r is Switch:
		return get_next(r)
	return r
