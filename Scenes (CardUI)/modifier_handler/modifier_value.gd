class_name ModifierValue
extends Node

enum Type {PERCENT_BASED, FLAT}

@export var type: Type
@export var percent_value: float
@export var flat_value: int
@export var source: String
