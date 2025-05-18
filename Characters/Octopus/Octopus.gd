extends CharacterBody2D

@onready var howl_scene : Howl = $Howl

func howl():
	howl_scene.activate()
