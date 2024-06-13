extends Control

const CHAR_SELECTOR_SCENE := preload("res://Scenes (CardUI)/ui/character_selector.tscn")

@onready var continue_button: Button = %Continue
@export var music: AudioStream



func _ready() -> void:
	get_tree().paused = false
	if has_node("/root/BGMusic"):
		var music_player = get_node("/root/BGMusic")
		music_player.play()
	

func _on_new_run_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECTOR_SCENE)


func _on_exit_pressed() -> void:
	get_tree().quit()
	
