extends RigidBody2D

var thrust = Vector2(500000, 0)
var torque = 1000000

func _integrate_forces(state):
	if Input.is_action_pressed("up"):
		state.apply_force(thrust.rotated(rotation))
		$Ship/Exhaust.show()
		$Ship/Exhaust.play()
	else:
		state.apply_force(Vector2())
		$Ship/Exhaust.hide()
		$Ship/Exhaust.stop()
	var rotation_direction = 0
	if Input.is_action_pressed("right"):
		rotation_direction += 1
	if Input.is_action_pressed("left"):
		rotation_direction -= 1
	state.apply_torque(rotation_direction * torque)
