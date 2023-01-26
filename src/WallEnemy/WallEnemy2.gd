extends Spatial


onready var pause : = get_node("res://src/UI/TryGame.tscn")


func _on_Area_body_exited(body: Node) -> void:
	PlayerData.died += 1



