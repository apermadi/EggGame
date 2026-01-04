extends Node

var item_list: Dictionary
var file: FileAccess
var index: int

func _ready() -> void:
	if (FileAccess.file_exists("res://item_type.json")):
		file = FileAccess.open("res://item_type.json", FileAccess.READ)
		item_list = JSON.parse_string(file.get_as_text())
		
		file.close()
	else:
		printerr("File does not exist :(")


func get_item_name() -> String:
	# TODO: move this when sprite file paths exist
	index = randi_range(0, item_list.list.size()-1)
	return item_list.list[index].name
