extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_start_pressed() -> void:
	Global.game_manager.change_scene(Global.TEST_LEVEL)

func _on_jungle_pressed() -> void:
	Global.game_manager.change_scene(Global.JUNGLE_DEMO)

func _on_quit_pressed():
	get_tree().quit()
