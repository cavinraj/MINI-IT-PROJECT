class_name CardState
extends Node

enum State {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

signal transition_requested(from: CardState, to: State)

@export var state: State

var card_ui: CardUI


func enter() -> void:
	pass
	
	
func exit() -> void:
	pass
	
	
func on_input(_event: InputEvent) -> void:
	pass
	
	
func on_gui_input(_event: InputEvent) -> void:
	pass
	
	
func on_mouse_entered() -> void:
	pass
	
	
func on_mouse_exited() -> void:
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
