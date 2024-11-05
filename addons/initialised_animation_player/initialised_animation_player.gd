@tool
@icon("res://addons/initialised_animation_player/initialised_animation_player.svg")
class_name InitialisedAnimationPlayer
extends AnimationPlayer

## InitialisedAnimationPlayer
##
## A animation player that plays a specified animation on [method Node._ready],
## if the specified animation exists.

## The name of the animation to play.
@export var initial_animation:StringName = "RESET"

## A custom blend value to play the [member initial_animation] with.
@export var custom_blend:float = -1

## A custom speed to play the [member initial_animation] with.
@export var custom_speed:float = 1.0

## Play the [member initial_animation] from the end.
@export var from_end := false

func _ready():
	play_initial_animation()

## Plays the [member initial_animation] as specified.
func play_initial_animation():
	if has_animation(initial_animation):
		play(initial_animation, custom_blend, custom_speed, from_end)
