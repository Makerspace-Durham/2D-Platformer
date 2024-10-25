# Sugar Bomb Documentation

## Storyline
Bomber is a sugar glider who was born with an artistic gift. He has gotten so good with his gift that he's known throughout the country! He was laying about, trying to come up with new challenges to do, when he got an idea: to travel the world and show it what he has to offer in the form of his art. Bomber has decided to make his mark on the world and will stop at nothing to achieve his new dream!

## Project Structure
There are 4 main folders: Assets, Raw_Assets, Scenes, and Scripts.

### Assets
The assets folder with contain all of the sprites used(or not) for the game. It's contents will be split up into sub-directories based on it's in-game use.
As an example, Character sprite sheets will be stored in the characters sub folder. 

### Raw_Assets
This is where you will store the original files for sprites in case there's a need for edited by another dev/artist. There is no sub-directory for this folder.

### Scenes
This is where your created entities will be stored. This **INCLUDES** the scripts that go with the scene. Level or environment objects will be stored in a folder called 'Environments' while a level itself will be stored in 'Levels'. The player and enemies object(s) should be stored in characters. We can create a Misc folder for objects that don't fit in the previous named folders

### Scripts
This is primarily for global scripts or scripts that can be used as a base for something else. Custom resources would go in this folder also.

## Coding Guidelines
- When creating a scene object that will have a script attached make sure the script is saved in the same directory as the scene object.
- There is a main node called "GameManager" that will be used to handle most of the basic game logic and where all of our menus, levels, and UI will be located. Common game uses like changing scenes, Ui updates, or moving to another area will be handled in this node.
- Anything that will need to be accessed by multiple scene objects across the game should probably be stored in the Global script. Make sure you comment it's use case. Will do my best to section out the script so there's a space for everything.
