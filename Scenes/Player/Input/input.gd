extends Node
class_name InputArray

func collect_active_inputs() -> InputPackage:
    var input_package = InputPackage.new()
    
    input_package.input_direction = Input.get_axis("move_left", "move_right")

    if Input.is_action_pressed("jump"):
        input_package.input_actions.append("jump")

    if Input.is_action_just_pressed("jump"):
        input_package.quick_time_actions.append("jump")
    
    # Print input direction
    print("Current input Direction: ", input_package.input_direction)
    return input_package
