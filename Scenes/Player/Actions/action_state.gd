 # state.gd
extends Node

class_name State

# This class mimics an abstract class in GDScript. Since GDScript does not support abstract classes, 
# we will use this class to enforce that subclasses implement the necessary methods.
# Unimplemented methods will push an error message to the console when called.

# -------------Required Abstract Methods-------------
func control(player, input, delta):
    # Abstract method, should be overridden by subclasses
    push_error("control() not implemented in subclass")

func abstraction(player, input, delta):
    # Abstract method, should be overridden by subclasses
    push_error("abstraction() not implemented in subclass")

func presentation(player):
    # Abstract method, should be overridden by subclasses
    push_error("presentation() not implemented in subclass")

# -------------Optional Overridable Methods-------------
# enter_state must call control
func enter_state(player, input, delta):
    # Unlike the other abstract methods, 
    # this method has a default implementation.
    control(player, input, delta)

# exit_state must call reset_state_flags and set the player's next current_state
func exit_state(player, input, delta):
    # Unlike the other abstract methods, 
    # this method has a default implementation.
    pass
