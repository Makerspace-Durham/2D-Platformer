# player.gd
extends CharacterBody2D

# Player Constants
const SPEED = 150.0
const INITIAL_JUMP_VELOCITY = -230.0
const CONTINUED_JUMP_VELOCITY = -260.0
const SLIDE_DECAY_SPEED = 150.0
const SLIDE_SPEED = 300.0
const JUMP_DURATION = 0.3
const WORLD_GRAVITY = 980.0
const FLYING_GRAVITY = 390.0

var lock_direction:bool = false
var direction:float = 0
var has_double_jumped = false

# Preload all Player States for easy access
@onready var idle: Node = $PlayerStates/Idle
@onready var run: Node = $PlayerStates/Running
@onready var jump: Node = $PlayerStates/Jump
@onready var fall: Node = $PlayerStates/Falling
@onready var glide: Node = $PlayerStates/Gliding

# Player Properties
@export var max_health: int = 100
var health: int = max_health:
    set(value):
        health = value

@export var max_double_jump_count: int = 1
var double_jump_count: int = max_double_jump_count

# Player Components 
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var input_gatherer: InputArray = $Input

var gravity = WORLD_GRAVITY
var current_state: Node

func _ready():
    current_state = idle

func _physics_process(delta):
    var input = input_gatherer.collect_active_inputs()
    apply_gravity(delta)
    current_state.control(self, input, delta)
    manage_player_behaviors()
    move_and_slide()

func apply_gravity(delta):
    if not is_on_floor():
        velocity.y += gravity * delta

func direct_sprite_based_on_velocity():
    # Flip the sprite based on the direction of the velocity
    if velocity.x < 0:
        animated_sprite_2d.flip_h = true
    elif velocity.x > 0:
        animated_sprite_2d.flip_h = false

func exit_state_and_transition(player, input, delta, state):
    current_state.exit_state(player, input, delta)
    current_state = state
    current_state.enter_state(player, input, delta)

func manage_player_behaviors():
    direct_sprite_based_on_velocity()

    if is_on_floor():
        double_jump_count = max_double_jump_count 
