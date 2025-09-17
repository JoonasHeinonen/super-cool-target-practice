extends CharacterBody2D

@onready var sprite = $TargetSprite

var sprite_index : int = 0
var speed : int = 50

var rng = RandomNumberGenerator.new()

func _ready():
	sprite_index = rng.randf_range(0, sprite.hframes)
	sprite.frame = sprite_index

func _physics_process(delta):
	if !Globle.is_track_over:
		velocity.y = speed
		move_and_slide()

func _on_bullseye_area_entered(area):
	if area.name == "Bullet":
		Globle.points += 10
		print("10 points: BULLSEYE!!!!")

func _on_whiteregion_area_entered(area):
	if area.name == "Bullet":
		Globle.points += 1
		print("1 point... ")

func _on_wall_detection_radius_area_entered(area):
	print("Detecting area: ", area)

func _on_wall_detection_radius_body_entered(body):
	print("Detecting body: ", body)
	if body.name == "Tiles":
		speed *= -1
