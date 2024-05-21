extends Control


func _on_button_pressed():
	Events.battle_reward_exited.emit()


func _on_back_button_pressed():
	pass # Replace with function body.
