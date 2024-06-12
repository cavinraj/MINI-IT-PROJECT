class_name Treasure
extends Control

@export var run_stats: RunStats
@export var char_stats: CharacterStats

@onready var animation_player: AnimationPlayer = %AnimationPlayer



func _on_treasure_opened() -> void:
	Events.treasure_room_exited.emit()
	
func _on_treasure_chest_gui_input(event: InputEvent):
	if animation_player.current_animation == "open":
		return
	
	if event.is_action_pressed("left_mouse"):
		animation_player.play("open")
