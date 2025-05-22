# idle_state.gd
extends State

class_name IdleState

# override the enter_state method and add method to kill velocity
# this prevents the player from sliding when transitioning 
# from a moving state
func enter_state(player, input, delta):
    remove_player_velocity(player)
    control(player, input, delta)


# Control function: Handles the core logic and animator
func control(player, input, delta):
    abstraction(player, input, delta)
    presentation(player)

# Abstraction function: Handles the core logic
func abstraction(player, input, delta):
    if not player.is_on_floor():
        # in cases where the floor is pulled out from under the player
        player.exit_state_and_transition(player, input, delta, player.fall)

    if input.input_direction != 0:
        player.exit_state_and_transition(player, input, delta, player.run)
    
    if input.quick_time_actions.has("jump"):
        player.exit_state_and_transition(player, input, delta, player.jump)
    

# Presentation function: Controls the animator
func presentation(player):
    player.get_node("AnimatedSprite2D").play("idle")


func remove_player_velocity(player):
    player.velocity = Vector2(0, 0)
