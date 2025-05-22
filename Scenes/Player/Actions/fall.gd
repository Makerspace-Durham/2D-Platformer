extends State
class_name FallState

func control(player, input, delta):
    abstraction(player, input, delta)
    presentation(player)

func abstraction(player, input, delta):
    player.velocity.x = input.input_direction * player.SPEED
    
    if player.is_on_floor():
        player.exit_state_and_transition(player, input, delta, player.idle)
      
    if input.quick_time_actions.has("jump") && player.double_jump_count > 0:
        player.exit_state_and_transition(player, input, delta, player.jump)
        
func presentation(player):
    player.get_node("AnimatedSprite2D").play("fall")
