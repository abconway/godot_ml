extends Node2D


const POINT = preload("res://scenes/point.tscn")

@onready var points: Node2D = $Points

var x: PackedFloat64Array = []
var y: PackedFloat64Array = []
var empty: PackedStringArray = [""]


func _ready() -> void:
	load_file()
	#print(x)
	#print(y)
	plot()


func plot() -> void:
	for index in range(len(x)):
		print(x[index], ", ", y[index])
		var point := POINT.instantiate()
		point.position = Vector2(x[index], y[index])
		points.add_child(point)
	

func load_file() -> void:
	var file = FileAccess.open("res://data/data.csv.txt", FileAccess.READ)
	var data = file.get_csv_line()
	while (data != empty):
		data = file.get_csv_line()
		if data != empty:
			x.append(float(data[0]))
			y.append(float(data[1]))
