extends Control



func _on_newGame_button_up() -> void:
	get_tree().change_scene("res://src/environment/world.tscn")
