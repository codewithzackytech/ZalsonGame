extends Actor

var direction : = Vector3.ZERO
var run = false setget set_run 
onready var walkAnim : = $AnimationPlayer
onready var PlayerAudio : = get_node('res://src/world.tscn/AudioStreamPlayer3D')

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("stat_game"):
		set_run(true)

func _physics_process(delta: float) -> void:
	direction = gameDirection() if run == true else Vector3(0,0,0)		
	_velocity = gameVelocity()
	
	if Input.is_action_pressed("jump") and is_on_floor():
		_velocity.y += _groundJump


	_velocity = move_and_slide(_velocity, Vector3.UP)

func gameDirection():
	walkAnim.play("walk")
	return Vector3(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0,-1
	)

func gameVelocity():
	
	# camera direction
	var camRotation = (transform.basis.z * direction.z + transform.basis.x * direction.x)
	
	_velocity.x = camRotation.x * _spead
	_velocity.z = camRotation.z * _spead
	
	_velocity.y -= _gravitaton * get_physics_process_delta_time()
		
	return _velocity


func set_run(value:bool) -> void:
	run = value

