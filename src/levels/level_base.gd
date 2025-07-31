extends Node2D

class_name Level

@export var is_weapon_allowed : bool

var player

func _ready():
	if self.has_node("Player"):
		player = get_node("Player")

	if !Globle.last_used_door_location:
		printerr("No last door defined")
	else:
		player.position = Globle.last_used_door_location
		
