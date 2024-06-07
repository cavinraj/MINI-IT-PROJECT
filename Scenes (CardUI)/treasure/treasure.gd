class_name Treasure
extends Control

const CARD_REWARDS = preload("res://Scenes (CardUI)/ui/card_rewards.tscn")
const TREASURE_REWARD_BUTTON = preload("res://Scenes (CardUI)/treasure/treasure_reward_button.tscn")
const TREASURE_ICON := preload("res://Assets/art/tile_0089.png")
const TREASURE_TEXT := "Open"

@export var run_stats: RunStats
@export var character_stats: CharacterStats

var price = 150

@onready var treasures: VBoxContainer = %Treasure
@onready var treasure_button: Button = $TreasureRewardButton
@onready var treasure_button_2: Button = $TreasureRewardButton2
@onready var treasure_button_3: Button = $TreasureRewardButton3

var treasure_card_reward_total_weight := 0.0

var treasure_card_rarity_weights := {
	Card.Rarity.COMMON: 0.0,
	Card.Rarity.UNCOMMON: 0.0,
	Card.Rarity.RARE: 0.0
}


func _ready() -> void:
	for node: Node in treasures.get_children():
		node.queue_free()
		
	var treasures = $Treasure
	
	
func add_card_reward() -> void:
	var treasure_card_reward := TREASURE_REWARD_BUTTON.instantiate() as TreasureRewardButton
	treasure_card_reward.treasure_icon = TREASURE_ICON
	treasure_card_reward.treasure_text = TREASURE_TEXT
	treasure_card_reward.pressed.connect(_show_card_rewards)
	treasures.add_child.call_deferred(treasure_card_reward)


func _show_card_rewards() -> void:
	if not run_stats or not character_stats:
		return
		
	var card_rewards := CARD_REWARDS.instantiate() as CardRewards
	add_child(card_rewards)
	card_rewards.card_reward_selected.connect(_on_card_reward_taken)
	
	var card_reward_array: Array[Card] = []
	var available_cards: Array[Card] = character_stats.draftable_cards.cards.duplicate(true)
	
	for i in run_stats.card_rewards:
		_setup_card_chances()
		var roll := randf_range(0.0, treasure_card_reward_total_weight)
		
		for rarity: Card.Rarity in treasure_card_rarity_weights:
			if treasure_card_rarity_weights[rarity] > roll:
				_modify_weights(rarity)
				var picked_card := _get_random_available_card(available_cards, rarity)
				card_reward_array.append(picked_card)
				available_cards.erase(picked_card)
				break
				
	card_rewards.rewards = card_reward_array
	card_rewards.show()
	
	
func _setup_card_chances() -> void:
	treasure_card_reward_total_weight = run_stats.treasure_common_weight + run_stats.treasure_uncommon_weight + run_stats.treasure_rare_weight
	treasure_card_rarity_weights[Card.Rarity.COMMON] = run_stats.treasure_common_weight
	treasure_card_rarity_weights[Card.Rarity.UNCOMMON] = run_stats.treasure_common_weight + run_stats.treasure_uncommon_weight
	treasure_card_rarity_weights[Card.Rarity.RARE] = treasure_card_reward_total_weight
	
	
func _modify_weights(rarity_rolled: Card.Rarity) -> void:
	if rarity_rolled == Card.Rarity.RARE:
		run_stats.treasure_rare_weight = RunStats.TREASURE_BASE_RARE_WEIGHT
	else:
		run_stats.treasure_rare_weight = clampf(run_stats.treasure_rare_weight + 6.0, run_stats.TREASURE_BASE_RARE_WEIGHT, 10.0)
		
	
func _get_random_available_card(available_cards: Array[Card], with_rarity: Card.Rarity) -> Card:
	var all_possible_cards := available_cards.filter(
		func(card: Card):
			return card.rarity == with_rarity
	)
	return all_possible_cards.pick_random()
	
	
func _on_card_reward_taken(card: Card) -> void:
	if not character_stats or not card:
		return
	
	price_check()
	run_stats.gold -= price
	character_stats.deck.add_card(card)


func price_check() -> void:
	if run_stats.gold < price:
		treasure_button.disabled = true
		treasure_button_2.disabled = true
		treasure_button_3.disabled = true
		

func _on_return_button_pressed():
	Events.treasure_room_exited.emit()
