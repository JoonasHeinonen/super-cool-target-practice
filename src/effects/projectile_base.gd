extends Area2D

class_name ProjectileBase

var speed = 450  # Initial speed of the projectile
var velocity = Vector2()
var bullet_gravity = 10  # Adjust this value to change the effect of gravity

func _ready():
	# Set the initial velocity based on the weapon's rotation
	var weapon = get_parent().get_node("Player").get_node("WeaponHolder")
	if weapon:
		velocity = Vector2(speed, 0).rotated(weapon.rotation)

func _physics_process(delta):
	velocity.y += bullet_gravity
	position += velocity * delta
	rotation = velocity.angle()

func _on_projectile_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
