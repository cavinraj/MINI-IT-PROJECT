class_name Hand
extends HBoxContainer

@export var char_stats: CharacterStats

@onready var card_ui := preload("res://Scenes (CardUI)/card_ui/card_ui.tscn")

var cards_played_this_turn := 0


func _ready() -> void:
	Events.card_played.connect(_on_card_played)


func _on_card_played(_card: Card) -> void:
	cards_played_this_turn += 1


func _on_card_ui_reparent_requested(child: CardUI) -> void:
	child.disabled = true
	child.reparent(self)
	var new_index := clampi(child.original_index - cards_played_this_turn, 0, get_child_count())
	move_child.call_deferred(child, new_index)
	child.set_deferred("disabled", false)
