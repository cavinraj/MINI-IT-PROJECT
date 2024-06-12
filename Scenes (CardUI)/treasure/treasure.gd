class_name Treasure
extends Control

@export var treasure_card_pool: Array[Card]
@export var char_stats: CharacterStats

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var found_card: Card

func generate_card() -> void:
	var available_card := treasure_card_pool
	found_card = available_card.pick_random()
	

func _on_treasure_opened() -> void:
	Events.treasure_room_exited.emit(found_card)
	
func _on_treasure_chest_gui_input(event: InputEvent):
	if animation_player.current_animation == "open":
		return
	
	if event.is_action_pressed("left_mouse"):
		animation_player.play("open")
