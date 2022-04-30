extends KinematicBody2D

#onready var nestNode = get_node("res://CompleteScene/EnemyNest.tscn")
#onready var speciesNode = get_node("res://CompleteScene/enemy.tscn")
#var system = load("res://BattleSystem/battleZone.tscn")

var manager = load("res://BattleSystem/SpawnManager.gd").new()

var up = null
var upPOS = null
var down = null
var downPOS = null
var left = null
var leftPOS = null
var right = null
var rightPOS = null
var dmg = Player.dmg
var typeName = "self"
#var rightVal = true
var leftVal = true
#var dmg = speciesNode.dmg * nestNode.population

func _ready():
	pass # Replace with function body.

func _process(delta):
	#var rightVal = 2
	#var downVal = true
	#var upVal = true
	var rightVal = true
	if rightVal == true:
		rightVal = _check(right, rightVal, rightPOS)
		#print(rightVal)
		if rightVal == false:
			#BattleZone.valid = true
			right = null
			#set_process(false)
			pass
	#if leftVal == true:
	#	leftVal = _check(left, leftVal, leftPOS)
	#	if leftVal == false:
	#		left = null


# it could be possible to have the spawn manager preload the node
# therefore allowing the process to continue invoking till it hits the wall
# implment this and everything should be solved then we can move onto
# playability and stats, finishing what we could for the demo.
func _check(type, typeVal, typePOS):
	#var typePOS = type.global_position
	#if (type == null):
	#	spawn("SpeciesOne.tscn", rightPOS)
	#print(type)
	if type == null:
		return false
	if type != null:
		if type.typeName != "wall" && type.typeName != "corner":
		#print(type.typeName)
			if type.typeName == "blank":
				type.health -= dmg
				#print(type.health)
				if type.health == 0:
					type.killedBy = name + ".tscn"
					spawn(manager.specie, typePOS)
					return false
		if type.typeName == "self":
			#print("working")
			#print("valid")
			typeVal = null
			#spawn(specie, rightPOS)
			return false
			#print(val)
			#return 0
		return true

func spawn(spawnType, spawnPosition):
	#var newSpawn = spawnType
	var newSpawn = spawnType.instance()
	add_child(newSpawn)
	newSpawn.global_position = spawnPosition
	right = newSpawn
	#print(get_parent())
	#print(newSpawn)
	#newSpawn.set_process(true)


func _on_Area2D_body_entered(body):
	right = body
	#print(body)
	rightPOS = body.global_position


func _on_Down_body_entered(body):
	down = body
	downPOS = body.global_position


func _on_Up_body_entered(body):
	up = body
	upPOS = body.global_position

func _on_Left_body_entered(body):
	#if body == "enemy":
	print(body)
	left = body
	leftPOS = body.global_position
