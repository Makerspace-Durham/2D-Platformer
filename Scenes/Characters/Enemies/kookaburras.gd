extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var speed = 35
var direction: Vector2
var is_enemy_chase: bool
var player: CharacterBody2D


func _ready():
	is_enemy_chase = false
	player = get_parent().get_node("Player")

func _process(delta):
	move(delta)
	handle_animations()

func move(delta):
	if is_enemy_chase:
		speed = 50
		velocity = position.direction_to(player.position) * speed
		direction.x = abs(velocity.x) / velocity.x
	elif !is_enemy_chase:
		velocity += direction * speed * delta
	move_and_slide()

# functionality for enemy random movement if is_enemy_chase is false
# Todos: Decide how enemies should function for game: i.e always chase or have line of sight functionality or patrol an area
#		 Set boundaries and collision AI -> currently the randomized movement can set the enemy way out of bounds
#										-> while is_enemy_chase is true, enemies can get stuck on level assets
#		 Decide how damage will work to player and/or enemies
func _on_timer_timeout():
	$Timer.wait_time = choose_timer_wait_time([0.5, 0.8])
	if !is_enemy_chase:
		direction = choose_timer_wait_time([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		print(direction)

func choose_timer_wait_time(array):
	array.shuffle()
	return array.front()

func handle_animations():
	animated_sprite.play("fly")
	if direction.x == -1:
		animated_sprite.flip_h = false
	elif direction.x == 1:
		animated_sprite.flip_h = true
