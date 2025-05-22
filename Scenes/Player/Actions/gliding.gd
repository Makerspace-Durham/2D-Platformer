extends State
class_name GlidingState

var glide_speed_multiplier: float = 1.2

func control(player, input, delta):
    abstraction(player, input, delta)
    presentation(player)

func abstraction(player, input, delta):

    if input.input_actions.has("jump"):
        player.gravity = 0
        player.velocity.y =  move_toward(player.velocity.y, player.FLYING_GRAVITY, delta * (player.FLYING_GRAVITY))
        player.velocity.x = input.input_direction * player.SPEED * glide_speed_multiplier
    else: 
        player.exit_state_and_transition(player, input, delta, player.fall)
    
    if player.is_on_floor():
        player.exit_state_and_transition(player, input, delta, player.idle)
        


func presentation(player):
    player.get_node("AnimatedSprite2D").play("glide")


func exit_state(player, input, delta):
    player.gravity = player.WORLD_GRAVITY
