extends Node

var next_scene_path : String = ""
var last_used_door : Area2D = null
var last_used_door_location : Vector2
var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Loading goble.gd")
