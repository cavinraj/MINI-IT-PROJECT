extends Control



@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_MODE_OPTIONS : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720)
}


func _ready() -> void:
	append_resolution_mode()
	option_button.item_selected.connect(on_resolution_mode_selected)
	
	

func append_resolution_mode() -> void:
	for RESOLUTION_MODE in RESOLUTION_MODE_OPTIONS:
		option_button.add_item(RESOLUTION_MODE)
		
		

func on_resolution_mode_selected(dict_value : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_MODE_OPTIONS.values()[dict_value])
