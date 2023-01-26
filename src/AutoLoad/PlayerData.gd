extends Node

signal score_updated
signal player_died

export var score : = 0 setget update_score
export var died : = 0 setget player_died



func update_score(value:int) -> void:
	score = value
	emit_signal("score_updated")

func  player_died(value:int) -> void:
	died = value
	emit_signal("player_died")


func _on_Area_mouse_entered() -> void:
	print("mouse entered")

