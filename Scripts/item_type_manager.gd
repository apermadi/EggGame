extends Node

var item_list: Dictionary
var file: FileAccess
var index: int

func _ready() -> void:
	if (FileAccess.file_exists("res://Data/item_type.json")):
		file = FileAccess.open("res://Data/item_type.json", FileAccess.READ)
		item_list = JSON.parse_string(file.get_as_text())
		
		file.close()
	else:
		printerr("File does not exist :(")


func get_item_name() -> String:
	index = randi_range(0, get_list_size())
	return item_list.list[index].name


func get_item_texture() -> Texture2D:
	if (item_list.list[index].path == ""):
		return load("res://Sprites/icon.svg")
	else:
		return load(item_list.list[index].path)


func get_list_size() -> int:
	return item_list.list.size()-1


func get_list_name(i : int) -> String:
	return item_list.list[i].name
