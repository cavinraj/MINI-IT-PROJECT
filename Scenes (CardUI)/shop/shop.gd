class_name Shop
extends Control

const CARD_REWARDS = preload("res://Scenes (CardUI)/ui/card_rewards.tscn")
const SHOP_BUY_BUTTON = preload("res://Scenes (CardUI)/shop/shop_buy_button.tscn")
const SHOP_ICON := preload("res://Assets/art/coupons.png")
const SHOP_TEXT := "Card Pack"
const SHOP_NOTICE_SCENE := preload("res://Scenes (CardUI)/shop/shop_notice.tscn")

var price = 30

@export var run_stats: RunStats
@export var character_stats: CharacterStats

@onready var map = $Map
@onready var node: Node = $Node
@onready var shops: HBoxContainer = %Shops
@onready var ShopBuyButton1: Button = $ShopBuyButton1
@onready var ShopBuyButton2: Button = $ShopBuyButton2

var shop_card_reward_total_weight := 0.0

var shop_card_rarity_weights := {
	Card.Rarity.COMMON: 0.0,
	Card.Rarity.UNCOMMON: 0.0,
	Card.Rarity.RARE: 0.0
}

func _ready() -> void:
	for node: Node in shops.get_children():
		node.queue_free()
		
	var shops = $Shops

func add_card_reward() -> void:
	var shop_card_reward := SHOP_BUY_BUTTON.instantiate() as shopbuybutton
	shop_card_reward.shop_icon = SHOP_ICON
	shop_card_reward.shop_text = SHOP_TEXT
	shop_card_reward.pressed.connect(_show_card_rewards)
	shops.add_child.call_deferred(shop_card_reward)
	

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
		var roll := randf_range(0.0, shop_card_reward_total_weight)
		
		for rarity: Card.Rarity in shop_card_rarity_weights:
			if shop_card_rarity_weights[rarity] > roll:
				_modify_weights(rarity)
				var picked_card := _get_random_available_card(available_cards, rarity)
				card_reward_array.append(picked_card)
				available_cards.erase(picked_card)
				break
				
	card_rewards.rewards = card_reward_array
	card_rewards.show()

func _setup_card_chances() -> void:
	shop_card_reward_total_weight = run_stats.shop_common_weight + run_stats.shop_uncommon_weight + run_stats.shop_rare_weight
	shop_card_rarity_weights[Card.Rarity.COMMON] = run_stats.shop_common_weight
	shop_card_rarity_weights[Card.Rarity.UNCOMMON] = run_stats.shop_common_weight + run_stats.shop_uncommon_weight
	shop_card_rarity_weights[Card.Rarity.RARE] = shop_card_reward_total_weight

func _modify_weights(rarity_rolled: Card.Rarity) -> void:
	if rarity_rolled == Card.Rarity.RARE:
		run_stats.shop_rare_weight = RunStats.SHOP_BASE_RARE_WEIGHT
	else:
		run_stats.shop_rare_weight = clampf(run_stats.shop_rare_weight + 6.0, run_stats.SHOP_BASE_RARE_WEIGHT, 10.0)

func _get_random_available_card(available_cards: Array[Card], with_rarity: Card.Rarity) -> Card:
	var all_possible_cards := available_cards.filter(
		func(card: Card):
			return card.rarity == with_rarity
	)
	return all_possible_cards.pick_random()
	
	
func _on_card_reward_taken(card: Card) -> void:
	if not character_stats or not card:
		return
	
	if run_stats.gold <= price:
		_shop_notice_entered()
	else:
		run_stats.gold -= price
		character_stats.deck.add_card(card)
	
	
func _shop_notice_entered() -> void:
	var shop_notice := _change_view(SHOP_NOTICE_SCENE) as ShopNotice


func _change_view(scene: PackedScene) -> Node:
	if node.get_child_count() > 0:
		node.get_child(0).queue_free()
		
	get_tree().paused = false
	var new_view := scene.instantiate()
	node.add_child(new_view)
	map.hide_map()

	return new_view
	
	
func _on_return_pressed():
	Events.shop_exited.emit()
