extends Spatial

var _mouseDelata : = Vector2.ZERO
var _lookSensitivity : = 15.0
var _minlookSen : = -20.0
var _maxlookSen := 70.0

onready var Zalson : = get_parent()
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_mouseDelata = event.relative

func _process(delta: float) -> void:
	var direction = Vector2(_mouseDelata.y, _mouseDelata.x) * _lookSensitivity * delta
	
	#rotation_degrees.x += direction.x
	rotation_degrees.x = clamp(rotation_degrees.x, _minlookSen, _maxlookSen)
	
	# zalson camera
	Zalson.rotation_degrees.y -= direction.y
	
	_mouseDelata = Vector2()
	
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

