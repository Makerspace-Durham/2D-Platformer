extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0
const SLIDE_DECAY_SPEED = 150.0
const SLIDE_SPEED = 300.0

var lock_direction:bool = false
var direction:float = 0

enum State { IDLE, RUNNING, JUMPING, FALLING, SLIDING, FLYING }
var current_state = State.IDLE

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
    # Initialization code here if needed
    pass

func _physics_process(delta):
    apply_gravity(delta)
    handle_input()
    handle_state()
    handle_movement(delta)
    handle_animation()
    direct_sprite_based_on_velocity()

func apply_gravity(delta):
    if not is_on_floor():
        if current_state == State.FLYING:
            velocity.y = move_toward(velocity.y, gravity, delta * (gravity/ 5))
        else:
            velocity.y += gravity * delta

func handle_input():
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY
        current_state = State.JUMPING
       
    elif Input.is_action_pressed("move_down") and is_on_floor():
        if Input.is_action_just_pressed("move_down"):
            velocity.x = SLIDE_SPEED * direction
        current_state = State.SLIDING
    elif Input.is_action_just_pressed("jump") and not is_on_floor():
        current_state = State.FLYING
    elif Input.is_action_just_released("jump") and not is_on_floor():
        current_state = State.FALLING


func handle_state():
    if is_on_floor():
        if current_state == State.SLIDING:
            lock_direction = true
            if Input.is_action_just_released("move_down"):
                current_state = State.IDLE
        elif velocity.x == 0:
            current_state = State.IDLE
            lock_direction = false
        else:
            current_state = State.RUNNING
            lock_direction = false
    else:
        if velocity.y < 0:
            if current_state != State.FLYING:
                current_state = State.JUMPING
                lock_direction = false
        else:
            if current_state != State.FLYING:
                current_state = State.FALLING
                lock_direction = false

func handle_movement(delta):
    if not lock_direction:
        direction = Input.get_axis("move_left", "move_right")

    if current_state == State.SLIDING:
        velocity.x = move_toward(velocity.x, 0, SLIDE_DECAY_SPEED * delta * 2)
    elif current_state == State.FLYING:
        velocity.x = direction * SPEED * 1.3
    else:
        if direction:
            velocity.x = direction * SPEED
        else:
            velocity.x = move_toward(velocity.x, 0, SPEED)
   
    move_and_slide()

func handle_animation():
    match current_state:
        State.IDLE:
            animated_sprite_2d.play("idle")
        State.RUNNING:
            animated_sprite_2d.play("run")
        State.JUMPING:
            animated_sprite_2d.play("jump")
        State.FALLING:
            animated_sprite_2d.play("fall")
        State.SLIDING:
            animated_sprite_2d.play("duck_and_slide")
        State.FLYING:
            animated_sprite_2d.play("fly")
           

func direct_sprite_based_on_velocity():
    if velocity.x < 0:
        animated_sprite_2d.flip_h = true
    elif velocity.x > 0:
        animated_sprite_2d.flip_h = false
     
