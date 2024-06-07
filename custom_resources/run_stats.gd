class_name RunStats
extends Resource

signal gold_changed

const STARTING_GOLD := 70
const BASE_CARD_REWARDS := 3
const BASE_COMMON_WEIGHT := 6.0
const BASE_UNCOMMON_WEIGHT := 3.7
const BASE_RARE_WEIGHT := 0.3
const TREASURE_BASE_COMMON_WEIGHT := 0.3
const TREASURE_BASE_UNCOMMON_WEIGHT := 3.7
const TREASURE_BASE_RARE_WEIGHT := 6.0

@export var gold := STARTING_GOLD : set = set_gold
@export var card_rewards := BASE_CARD_REWARDS
@export_range(0.0, 10.0) var common_weight := BASE_COMMON_WEIGHT
@export_range(0.0, 10.0) var uncommon_weight := BASE_UNCOMMON_WEIGHT
@export_range(0.0, 10.0) var rare_weight := BASE_RARE_WEIGHT
@export_range(0.0, 10.0) var treasure_common_weight := TREASURE_BASE_COMMON_WEIGHT
@export_range(0.0, 10.0) var treasure_uncommon_weight := TREASURE_BASE_UNCOMMON_WEIGHT
@export_range(0.0, 10.0) var treasure_rare_weight := TREASURE_BASE_RARE_WEIGHT


func set_gold(new_amount: int) -> void:
	gold = new_amount
	gold_changed.emit()


func reset_weights() -> void:
	common_weight = BASE_COMMON_WEIGHT
	uncommon_weight = BASE_UNCOMMON_WEIGHT
	rare_weight = BASE_RARE_WEIGHT

func reset_treasure_weights() -> void:
	treasure_common_weight = TREASURE_BASE_COMMON_WEIGHT
	treasure_uncommon_weight = TREASURE_BASE_UNCOMMON_WEIGHT
	treasure_rare_weight = TREASURE_BASE_RARE_WEIGHT
