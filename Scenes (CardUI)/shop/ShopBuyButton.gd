class_name shopbuybutton
extends Button


@export var run_stats: RunStats
@export var shop_icon: Texture : set = set_reward_icon
@export var shop_text: String : set = set_reward_text
var price = 30

@onready var custom_shop_icon: TextureRect = %CustomIcon
@onready var custom_shop_text: Label = %CustomText


func set_reward_icon(new_icon: Texture) -> void:
	shop_icon = new_icon
	
	if not is_node_ready():
		await ready
		
	custom_shop_icon.texture = shop_icon


func set_reward_text(new_text: String) -> void:
	shop_text = new_text
	
	if not is_node_ready():
		await ready
		
	custom_shop_text.text = shop_text


func _on_pressed() -> void:
	queue_free()
