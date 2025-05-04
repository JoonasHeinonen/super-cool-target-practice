extends Area2D

@export var exit : bool = false
@export_file("*.tscn") var scene_to_transit_to : String

var door_active : bool

func _ready():
	if exit:
		$DirectionUI.frame = 0
	else:
		$DirectionUI.frame = 1

func _process(delta):
	if door_active && Input.is_action_just_pressed("ui_accept"):
		if exit:
			get_tree().quit()
		else:
			get_tree().change_scene_to_file(scene_to_transit_to)

func _on_area_entered(area):
	$DirectionUI.show()
	door_active = true

func _on_area_exited(area):
	$DirectionUI.hide()
	door_active = false
