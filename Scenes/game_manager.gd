extends Node

@onready var musicPlayer = $MusicPlayer #AudioStreamPlayer node
@onready var mainScene = $MainScene #MainScene node

#Used for changing scenes in the game
func change_scene(scene: String):
	mainScene.get_child(0).queue_free() #Free the maine scene from it's child or children
	var s = ResourceLoader.load(scene) #Load up an instance of the given scene to be displayed
	mainScene.add_child(s.instantiate()) #Add the scene instance as a child to main scene
