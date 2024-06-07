class_name TreasureRewardButton
extends Button

@export var treasure_icon: Texture : set = set_reward_icon
@export var treasure_text: String : set = set_reward_text

@onready var custom_treasure_icon: TextureRect = %Custom_Treasure_Icon
@onready var custom_treasure_text: Label = %Custom_Treasure_Text


func set_reward_icon(new_icon: Texture) -> void:
	treasure_icon = new_icon
	
	if not is_node_ready():
		await ready
		
	custom_treasure_icon.texture = treasure_icon


func set_reward_text(new_text: String) -> void:
	treasure_text = new_text
	
	if not is_node_ready():
		await ready
		
	custom_treasure_text.text = treasure_text


func _on_pressed() -> void:
	queue_free()
