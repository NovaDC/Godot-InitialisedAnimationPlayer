@tool
@icon("res://addons/initialised_animation_player/initialised_animation_player.svg")
class_name InitialisedAnimationPlayer
extends AnimationPlayer

## InitialisedAnimationPlayer
##
## @deprecated: As of Godot v4.2.1, the ability to set animations to play on ready is built in.
## A animation player that plays a specified animation on [method Node._ready],
## if the specified animation exists.

## The name of the animation to play.
@export var initial_animation:StringName = "RESET":
	get:
		return initial_animation
	set(_value):
		initial_animation = _value
		update_configuration_warnings()

## A custom blend value to play the [member initial_animation] with.
@export var custom_blend:float = -1

## A custom speed to play the [member initial_animation] with.
@export var custom_speed:float = 1.0

## Play the [member initial_animation] from the end.
@export var from_end := false

func _ready():
	play_initial_animation()
	animation_libraries_updated.connect(update_configuration_warnings)
	animation_list_changed.connect(update_configuration_warnings)

## Plays the [member initial_animation] as specified.
func play_initial_animation():
	if has_animation(initial_animation):
		play(initial_animation, custom_blend, custom_speed, from_end)

func _get_configuration_warnings() -> PackedStringArray:
	if get_animation_list().is_empty() or has_animation(initial_animation):
		return PackedStringArray()
	return PackedStringArray(["Inital animation named '%s' could not be found." % [initial_animation]])
