extends Node

@onready var music_player = $MusicPlayer #AudioStreamPlayer node
@onready var main_scene = $MainScene #MainScene node

func _ready() -> void:
	change_song(Global.PIXELATED_DREAMS)

#Used for changing scenes in the game
func change_scene(scene: String):
	main_scene.get_child(0).queue_free() #Free the maine scene from it's child or children
	var s = ResourceLoader.load(scene) #Load up an instance of the given scene to be displayed
	main_scene.add_child(s.instantiate()) #Add the scene instance as a child to main scene

func change_song(song: String):
	music_player.stream = load(song)
	music_player.play()

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
