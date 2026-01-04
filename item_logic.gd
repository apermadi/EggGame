class_name Item
extends Node2D

signal despawn
signal display

@onready var display_timer : Timer = $DisplayTimer
@onready var display_item : Control = $DisplayTimer/ItemName

var path_timer: Timer
var type: String

func _ready() -> void:
	display.connect(display_timer.start)
	type = ItemTypeManager.get_item_name()


func connect_despawn() -> void:
	despawn.connect(path_timer.start)


func _on_ground_detection_body_entered(_body: Node2D) -> void:
	despawn.emit()
	queue_free()


func _on_player_detection_body_entered(_body: Node2D) -> void:
	visible = false
	
	display_timer.start()
	display_item.visible = true
	display_item.get_node("Label").text = type 
	get_tree().paused = true


func _on_display_timer_timeout() -> void:
	despawn.emit()
	
	display_item.visible = false
	get_tree().paused = false
	
	queue_free()
