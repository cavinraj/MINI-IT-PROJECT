class_name ShopNotice
extends Control

@export var run_stats: RunStats

func _on_return_button_pressed():
	Events.shop_notice_exited.emit()
