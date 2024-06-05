extends Node2D

const ARC_POINTS := 4

@onready var area_2d: Area2D = $Area2D #for collisions
@onready var card_arc: Line2D = $CanvasLayer/CardArc

var current_card: CardUI 
var targeting := false #track if we are in a targeting proccess

func _ready() -> void:
	Events.card_aim_started.connect(_on_card_aim_started)
	Events.card_aim_ended.connect(_on_card_aim_ended)

func _process(_delta: float) -> void:
	if not targeting:
		return
		
	area_2d.position = get_local_mouse_position() #update area 2d position to mouse
	card_arc.points = _get_points() #calculating points

func _get_points() -> Array : #for card arc positon
	var points := [] #defining
	var start := current_card.global_position
	start.x += (current_card.size.x / 2) #middle positon
	var target := get_local_mouse_position () #ending
	var distance := (target - start)
	
	for i in range(ARC_POINTS) : #loop to define position of card arc
		var t := (1.0 / ARC_POINTS) * i #sample all the points
		var x := start.x + (distance.x / ARC_POINTS) * i #calculate coordinates
		var y := start.y + ease_out_cubic(t) * distance.y #tweening
		points.append(Vector2(x, y))
		
	points. append (target) #add target to the end of array 
	
	return points

func ease_out_cubic(number : float) -> float:
	return 1.0 - pow(1.0 - number, 3.0) #equation for smooth arc

func _on_card_aim_started(card: CardUI) -> void: #Termitates action if signal started with a non single targeted
	if not card.card.is_single_targeted(): 
		return
			
	targeting = true
	area_2d. monitoring = true
	area_2d.monitorable = true
	current_card = card

func _on_card_aim_ended(_card: CardUI) -> void: 
	targeting = false
	card_arc.clear_points()
	area_2d.position = Vector2.ZERO
	area_2d.monitoring = false
	area_2d.monitorable = false
	current_card = null

func _on_area_2d_area_entered(area: Area2D) -> void: #To check if we have selected aan enemy or not
	if not current_card or not targeting:
		return #goes back to base
		
	if not current_card.targets.has(area):
		current_card.targets.append(area)
		current_card.request_tooltip()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if not current_card or not targeting:
		return
		
	current_card.targets.erase(area) #erase enemy erea from current card ui array
	current_card.request_tooltip()
