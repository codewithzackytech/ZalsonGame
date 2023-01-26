extends Control

onready var score_label : = get_node("Score_label")
var pause : = false setget pauseZalson
onready var Trygame : = get_node("Try")
onready var goHome : = get_node("goHome2")

func _ready() -> void:
	
	PlayerData.connect('score_updated', self, 'update_score')
	PlayerData.connect("player_died", self, "die_zalson")
	update_score()
	
func die_zalson() -> void:
	self.pause = true
	
	
func update_score() -> void:
	score_label.text = "Score %s" % PlayerData.score
	
func pauseZalson(value:bool) -> void:
	Trygame.visible = true
	goHome.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true







func _on_Try_button_up() -> void:
	Trygame.visible = false
	goHome.visible = false
	print('pressed1')
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false



func _on_Try_focus_entered() -> void:
	print("pressed1")


func _on_Try_modal_closed() -> void:
	print("hh")


func _on_Button_button_up() -> void:
	print('hhh')


func _on_Try_mouse_entered() -> void:
	Trygame.visible = false
	goHome.visible = false
	print('pressed1')
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://src/environment/world.tscn")
	get_tree().paused = false


