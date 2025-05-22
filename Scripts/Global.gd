extends Node
#This file is used as a singleton. It will be autoloaded when the game starts
#Anything added here can be access across all nodes/scripts

#Levels
var TEST_LEVEL="res://Scenes/Levels/test.tscn"
var JUNGLE_DEMO="res://Scenes/Levels/jungle_demo.tscn"

#Soundtrack
var PIXELATED_DREAMS="res://Assets/Audio/Music/Pixelated Dreams.mp3"
var PIXELATED_JOURNEY="res://Assets/Audio/Music/Pixelated Journey.mp3"

#Misc
@onready var game_manager = get_tree().root.get_node("GameManager")
