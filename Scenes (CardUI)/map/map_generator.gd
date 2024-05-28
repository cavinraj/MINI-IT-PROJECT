class_name MapGenerator
extends Node

const X_DIST := 30
const Y_DIST := 25
const PLACEMENT_RANDOMNESS := 5
const FLOORS := 15
const MAP_WIDTH := 7
const PATHS := 6
const MONSTER_ROOM_WEIGHT : = 10.0
const SHOP_ROOM_WEIGHT : = 2.5
const CAMPFIRE_ROOM_WEIGHT : = 4.0

var random_room_type_weights = {
	Room.Type.MONSTER: 0.0,
	Room.Type.CAMPFIRE: 0.0
}

var random_room_type_total_weight := 0
var map_data: Array[Array]

func _ready() -> void:
	generate_map()


func generate_map() -> Array[Array]:
	map_data = _generate_initial_grid()
	
	var i := 0
	for floor in map_data:
		print("floor %s: %s" % [i, floor])
		i += 1
	
	return []
	
func _generate_initial_grid() -> Array[Array]:
	var result: Array[Array] = []
	
	
	for i in FLOORS: #repeating 15 times
		var adjacent_rooms: Array[Room]= [] #adjacent rooms for floor 0
		
		for j in MAP_WIDTH: #repeat 7 times
			var current_room := Room.new()
			var offset := Vector2(randf(), randf()) * PLACEMENT_RANDOMNESS
			current_room.position = Vector2(j * X_DIST, i * -Y_DIST) + offset
			current_room.row = i
			current_room.column = j
			current_room.next_rooms = []
			
			#boss room has a non random Y
			if i == FLOORS - 1:
				current_room.position.y = (i + 1) * -Y_DIST
				
			adjacent_rooms.append(current_room)
			
		result.append(adjacent_rooms) #becomes complete floor
		
	return result
	
	
	
	
	
