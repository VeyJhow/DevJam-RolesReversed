extends HSlider


#Se quiser fazer sliders individuais
@export var Master : String

var bus_index: int

func _ready():
	bus_index = AudioServer.get_bus_index(Master)
	value_changed.connect(on_value_changed)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
