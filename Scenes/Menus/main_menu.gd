extends Control

@onready var game_manager = get_tree().root.get_node("GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed() -> void:
	game_manager.change_scene(Global.TEST_LEVEL)


func _on_quit_pressed():
	get_tree().quit()
