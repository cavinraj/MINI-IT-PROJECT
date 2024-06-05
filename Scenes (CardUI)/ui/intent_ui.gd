class_name IntentUI
extends HBoxContainer

@onready var icon: TextureRect = $Icon
@onready var label: Label = $Label


func update_intent (intent: Intent) -> void:
	if not intent: # safety check, if not valid intent resource, debug
		hide()
		return
		
	icon.texture = intent.icon
	icon.visible = icon.texture != null #we want it visible if not null, if it is null means icon resources was left empty, debug
	label.text = str(intent.current_text)
	label.visible = intent.current_text.length() > 0 #if empty string, we dont display. we assigned every resource with a string, just a debug
	show()
