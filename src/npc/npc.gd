extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var collision_enabled = true

func _physics_process(delta):
	if collision_enabled:
		if not is_on_floor():
			velocity.y += gravity * delta
	else:
		velocity = Vector2.ZERO  # Freeze movement when collision disabled

