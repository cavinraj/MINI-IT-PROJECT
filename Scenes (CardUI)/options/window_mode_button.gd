extends Control


@onready var option_button = $HBoxContainer/OptionButton as OptionButton


const WINDOW_MODE_OPTIONS : Array[String] = ["Full-Screen","Window Mode"]



func _ready() -> void:
	append_window_mode()
	option_button.item_selected.connect(on_selected_window)
	
	
func append_window_mode() -> void:
	for WINDOW_OPTIONS in WINDOW_MODE_OPTIONS:
		option_button.add_item(WINDOW_OPTIONS)
		
		

func on_selected_window(index : int) -> void:
	match index:
		0:
			# FULL-SCREEN
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			
		1:
			# WINDOW-MODE
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			
