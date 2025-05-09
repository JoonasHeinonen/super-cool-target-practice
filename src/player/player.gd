extends CharacterBody2D

@onready var parent = get_parent()
@onready var weapon = $WeaponSprite

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Actions pressed.
	if Input.is_action_pressed("ui_left"):
		$PlayerSprite.scale.x = 1
		velocity.x = -2 * SPEED
	if Input.is_action_pressed("ui_right"):
		$PlayerSprite.scale.x = -1
		velocity.x = 2 * SPEED

	# Actions released.
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = move_toward(velocity.x, 0, SPEED)

	wield_weapon()
	rotate_weapon()
	move_and_slide()

func rotate_weapon():
	var mousePos = get_global_mouse_position()
	weapon.look_at(mousePos)

func wield_weapon():
	if parent is Level and parent.is_weapon_allowed:
		weapon.show()
	else:
		weapon.hide()
