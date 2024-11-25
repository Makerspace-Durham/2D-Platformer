extends Control
var scene = preload("res://Scenes/Sandbox/jiarguet_sandbox.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_start_pressed() -> void:
	Global.game_manager.change_scene(Global.TEST_LEVEL)


func _on_quit_pressed():
    get_tree().quit()


func _on_start_pressed() -> void:
    get_tree().root.add_child(scene)
