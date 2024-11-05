@tool
extends EditorPlugin

const PLUGIN_NAME := "InitialisedAnimationPlayer"

const PLUGIN_ICON := preload("res://addons/initialised_animation_player/initialised_animation_player.svg")

func _get_plugin_name() -> String:
	return PLUGIN_NAME

func _get_plugin_icon() -> Texture2D:
	return PLUGIN_ICON
