class_name ReSprite
extends Sprite2D

@export
var fps: int = 1

@onready
var root = (get_child(0) as Switch)

var ticker: Timer

@export
var drivers: Array[Driver]

var current: ReAnimation = null

func _ready():
	ticker = Timer.new()
	ticker.wait_time = 1/fps
	ticker.timeout.connect(func():
		resolve_tree()
	)
	ticker.autostart = true
	add_child(ticker)

func add_driver(name, value):
	for d in drivers:
		if d.name == name:
			d.value = value
			return
	drivers.append(Driver.new(name, value))

func remove_driver(name):
	for d in len(drivers):
		if drivers[d].name == name:
			drivers.remove_at(d)
			return

func resolve_tree():
	var r = get_next(root)
	if r is ReAnimation:
		if r != current and current != null:
			current.cleanup(drivers)
		var cell = r.get_cell(drivers)
		if cell != null:
			texture = cell.tex
	
func get_next(switch: Switch):
	var r = switch.select(drivers)
	if r is Switch:
		return get_next(r)
	return r
