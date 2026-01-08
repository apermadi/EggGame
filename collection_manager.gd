extends Node


class pair:
	var first
	var second

var collection : Dictionary = {}

func _ready() -> void:
	for item in ItemTypeManager.item_list.list:
		var info : pair = pair.new()
		info.first = item.path
		info.second = 0
		collection[item.name] = info
	add_item("gecko")
	
	print(collection.get("gecko"))


func add_item(item_name : String) -> void:
	collection.item_name = 200
