extends KinematicBody2D

enum STATES {
	WATER,
	HOME
}

enum MUTATIONS {
	CLAWS
}

export(STATES) var state = 1

const SPEED = 100
#var state = WATER
var move = Vector2.ZERO
var speed = 1
var water = null
var nests = null
var weight = 0
var weightMax = 12
var waterValid = false
var origins = 0
var dmg = 5

var mutationsList = [null, null, null, null, null, null, null, null]

#var nest = preload("res://Scenes/Nest.tscn")

func _ready():
	origins = global_position
	_change_state(STATES.WATER)
	
	
func _process(delta):
	match state:
		STATES.WATER:
			move = Vector2.ZERO
						
			var xLoc = 0
			var yLoc = 0
			var xpos = 0
			var ypos = 0
			var xLocPlus = 0
			var yLocPlus = 0
			
			if (weight != 12):
				#_change_state(STATES.HOME)
				if water != null:
					#var rand = RandomNumberGenerator
					#randomize()
					#var val = rand_range(1, 100)
					#var pos = water.position
					#pos.position.y += val
					move = position.direction_to(water.position) * speed
			
				move = move.normalized()
				move = move_and_collide(move)
				
				#xLoc = water.position.x - (90 / 2)
				#yLoc = (60 / 2) - water.position.y
				#xLocPlus = water.position.x + (75 / 2)
				#yLocPlus = water.position.y + (75 / 2)
				#xpos = position.x
				#ypos = position.y
				
				#print(yLocPlus)
				#print("....")
				#print(ypos)
				#if (xpos >= xLoc && xpos <= xLocPlus && ypos >= yLoc && ypos <= yLocPlus):
				#	weight += 1
				#rint(weight)
			else:
				#print(weight)
				#print("true")
				_change_state(STATES.HOME)
		STATES.HOME:
			move = Vector2.ZERO
			
			var xLoc = 0
			var yLoc = 0
			var xpos = 0
			var ypos = 0
			var xLocPlus = 0
			var yLocPlus = 0
			
			if (weight != 0):
				if nests != null:
					move = position.direction_to(nests.position) * speed
				
				#print(move)
				move = move.normalized()
				move = move_and_collide(move)
				
				#xLoc = nests.position.x + (85 / 2)
				#yLoc = (50 / 2) - nests.position.y
				#xLocPlus = nests.position.x + (75 / 2)
				#yLocPlus = nests.position.y + (75 / 2)
				#xpos = position.x
				#ypos = position.y
				
				#print(yLoc)
				#print("....")
				#print(ypos)
				#if (xpos >= xLoc && ypos >= yLoc && weight == weightMax):
				#	print("yeah")
				#	weight -= 1
				
			else:
				#print("yeah")
				_change_state(STATES.WATER)

func _change_state(newState):
	if newState == STATES.WATER:
		pass
	elif newState == STATES.HOME:
	#	# find Enemy and Go for it
		pass
	state = newState
	

func _on_WaterDetection_body_entered(body):
	if body.name == "Water":
		water = body


func _on_WaterDetection_body_exited(body):
	water = null



func _on_Hitbox_area_entered(area):
	#print("yes")
	pass


func _on_NestDetection_body_entered(body):
	if body.name == "Nest":
		nests = body


func _on_NestDetection_body_exited(body):
	nests = null
