extends Node2D



func _on_quit_button_2_pressed():
	get_tree().quit()
func _on_start_button_2_pressed():
	get_tree().change_scene_to_file("res://Scene1.tscn")
func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://Shop.tscn")




func _on_test_button_pressed():
	get_tree().change_scene_to_file("res://teest")
