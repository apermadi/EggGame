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


func add_to_count(item_name : String) -> void:
	collection.get(item_name).second += 1 


func get_item_count(item_name : String) -> int:
	return collection.get(item_name).second
