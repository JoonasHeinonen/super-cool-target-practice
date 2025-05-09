extends Area2D

@export var exit : bool = false
@export_file("*.tscn") var scene_to_transit_to : String

@onready var parent = get_parent()

var door_active : bool

func _ready():
	print("Name: ", self.name, " Position: ", self.position)
	if Globle.last_used_door:
		print("Last used door location: ", Globle.last_used_door_location)
	else:
		print("No last used door set.")

	if exit:
		$DirectionUI.frame = 0
	else:
		if parent is Level and parent.is_weapon_allowed:
			$DirectionUI.frame = 2
		else:
			$DirectionUI.frame = 1

func _process(delta):
	if door_active && Input.is_action_just_pressed("ui_accept"):
		if exit:
			get_tree().quit()
		else:
			Globle.last_used_door = self
			Globle.last_used_door_location = self.position
			get_tree().change_scene_to_file(scene_to_transit_to)

func _on_area_entered(area):
	$DirectionUI.show()
	door_active = true

func _on_area_exited(area):
	$DirectionUI.hide()
	door_active = false
