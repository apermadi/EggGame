extends Path2D

@onready var timer : Timer = $Timer

var item_scene : PackedScene
var item : Item
var first_point : Vector2
var last_point : Vector2
var spawn_point : float


func _enter_tree() -> void:
	item_scene = preload("res://item.tscn")
	first_point = get_curve().get_baked_points()[0]
	last_point = get_curve().get_baked_points()[-1]


func _on_timer_timeout() -> void:
	spawn_point = randf_range(first_point.x, last_point.x)
	
	item = item_scene.instantiate()
	item.position = Vector2(spawn_point, first_point.y)
	item.path_timer = timer
	item.connect_despawn()
	
	add_child(item)
