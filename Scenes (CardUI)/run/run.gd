class_name Run
extends Node

const BATTLE_SCENE := preload("res://Scenes (CardUI)/Battle/Battle.tscn")
const BATTLE_REWARD_SCENE := preload("res://Scenes (CardUI)/battle_reward/battle_reward.tscn")
const CAMPFIRE_SCENE := preload("res://Scenes (CardUI)/campfire/campfire.tscn")
const MAP_SCENE := preload("res://Scenes (CardUI)/map/map.tscn")
const SHOP_SCENE := preload("res://Scenes (CardUI)/shop/shop.tscn")
const TREASURE_SCENE := preload("res://Scenes (CardUI)/treasure/treasure.tscn")

@onready var current_view: Node = $CurrentView
@onready var battle_button: Button = %BattleButton
@onready var campfire_button: Button = %CampfireButton
@onready var map_button: Button = %MapButton
@onready var rewards_button: Button = %RewardsButton
@onready var shop_button: Button = %ShopButton
@onready var treasure_button: Button = %TreasureButton

var character: CharacterStats


func _ready() -> void:
	if not character:
		var warrior := load("res://characters/Warrior/warrior.tres")
		character = warrior.create_instance()
		_start_run()


func _start_run() -> void:
	_setup_event_connections()
	print("TODO: procedurally generated map")
	
	
func _change_view(scene: PackedScene) -> void:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()
		
	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)


func _setup_event_connections() -> void:
	Events.battle_won.connect(_change_view.bind(BATTLE_REWARD_SCENE))
	Events.battle_reward_exited.connect(_change_view.bind(MAP_SCENE))
	Events.campfire_exited.connect(_change_view.bind(MAP_SCENE))
	Events.map_exited.connect(_on_map_exited)
	Events.shop_exited.connect(_change_view.bind(MAP_SCENE))
	Events.tresure_room_exited.connect(_change_view.bind(MAP_SCENE))
	
	battle_button.pressed.connect(_change_view.bind(BATTLE_SCENE))
	campfire_button.pressed.connect(_change_view.bind(CAMPFIRE_SCENE))
	map_button.pressed.connect(_change_view.bind(MAP_SCENE))
	rewards_button.pressed.connect(_change_view.bind(BATTLE_REWARD_SCENE))
	shop_button.pressed.connect(_change_view.bind(SHOP_SCENE))
	treasure_button.pressed.connect(_change_view.bind(TREASURE_SCENE))
	
	
func _on_map_exited() -> void:
	print("TODO: from the MAP, change the view based on room type")
	
