extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD : = 138 #For if mouse goes to bottom screen, card select cancels.


func enter() -> void: #dugging #to clear targets array card UI
	card_ui.targets.clear()
	var offset := Vector2(card_ui.parent.size.x / 2, -card_ui.size.y / 2) #calculating position of card to animate it
	offset.x -= card_ui.size.x / 2
	card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2) #Animates card to go to center of hand
	card_ui.drop_point_detector.monitoring = false #Ignores moving card over the card drop of area to not get false targets
	Events.card_aim_started.emit(card_ui) #Notify event bus to fire cardaimstarted


func exit() -> void: #Card aim ended
	Events.card_aim_ended.emit(card_ui)


func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var mouse_at_bottom := card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD #checking threshold
	
	if (mouse_motion and mouse_at_bottom) or event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, CardState.State.BASE) #goback
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled() #Makes sure nothing picks up this input
		transition_requested.emit(self, CardState.State.RELEASED)
