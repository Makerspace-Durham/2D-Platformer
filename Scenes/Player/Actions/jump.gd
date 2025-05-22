extends State
class_name JumpState


@onready var double_jump_timer: Timer = $DoubleJumpTimer

func enter_state(player, input, delta):
    if player.is_on_floor():
        player.velocity.y = player.INITIAL_JUMP_VELOCITY
        return 
    else: 
        control(player, input, delta)


func control(player, input, delta):
    abstraction(player, input, delta)
    presentation(player)


func abstraction(player, input, delta):
    player.velocity.x = input.input_direction * player.SPEED
   
    # Double Jump
    if input.quick_time_actions.has("jump") and player.double_jump_count > 0:
        if not is_double_jump_timer_is_running():
            # Gives time for the jump to push the player up
            # before transitioning to next state
            double_jump_timer.start()
        print("double jump")
        player.velocity.y = player.INITIAL_JUMP_VELOCITY
        player.double_jump_count -= 1
        
    
    player.velocity.y += delta * player.CONTINUED_JUMP_VELOCITY

    # ----------exit cases----------: 
    # double jump exit
    if input.input_actions.has("jump") && not is_double_jump_timer_is_running():
            player.exit_state_and_transition(player, input, delta, player.glide)
    else: 
        # single jump exit
        # if player velocity is less than 0, then the player is falling
        if player.velocity.y > 0:
            player.exit_state_and_transition(player, input, delta, player.fall)
        

func presentation(player):
    if is_double_jump_timer_is_running():
        player.get_node("AnimatedSprite2D").play("double_jump")
    else:
        player.get_node("AnimatedSprite2D").play("jump")

# --------- Helper Functions ----------
func is_double_jump_timer_is_running():
    if double_jump_timer.time_left <= 0:
        return false
    else:
        return true
