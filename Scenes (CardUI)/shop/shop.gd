extends Control

func _on_return_pressed():
	Events.shop_exited.emit()
