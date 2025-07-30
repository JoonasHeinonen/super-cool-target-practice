extends CharacterBody2D

@onready var sprite = $TargetSprite

var sprite_index : int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	sprite_index = rng.randf_range(0, sprite.hframes)
	sprite.frame = sprite_index

func _physics_process(delta):
	pass

func _on_bullseye_area_entered(area):
	print("10 points: BULLSEYE!!!!")

func _on_whiteregion_area_entered(area):
	print("1 point...")
