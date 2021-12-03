extends Node2D

onready var pos = $Position2D
var creature = preload("res://CompleteScene/enemy.tscn")
var player = null
var enemy = null
var storage = 0
var growthrate = 36

func _process(delta):
	if enemy != null:
		#print("true")
		storage += enemy.weight
		enemy.weight = 0
		#print(weight)
	if (storage >= growthrate):
		spawn(creature, enemy.origins)
		storage -= growthrate
	#if Input.is_action_just_pressed("ui_accept"):
	#	spawn(creature, pos)

func spawn(spawnType, spawnPosition):
	var newSpawn = spawnType.instance()
	add_child(newSpawn)
	newSpawn.global_position = spawnPosition
	newSpawn.global_position.x += 15
	newSpawn.global_position.y += 25
	
func addMutations(mutations):
	if (enemy.mutationList.size() == 8):
		return null
	else:
		var index = 0
		for i in enemy.mutationList:
			if (enemy.mutationList[i] == null):
				index = i
				break
				
		if (mutations == "CLAWS"): # increase damage by 25%
			enemy.dmg = (enemy.dmg * .25) + enemy.dmg
			enemy.mutationList[index] = "CLAWS"
		elif (mutations == "SCALES"): # increase health by 25%
			enemy.hp = (enemy.hp * .25) + enemy.hp
			enemy.mutationList[index] = "SCALES"
		elif (mutations == "MUSCLEMASS"): # increase weight maximum by 25%
			enemy.weightMax = (enemy.weightMax * .25) + enemy.weightMax 
			enemy.mutationList[index] = "MUSCLEMASS"
		elif (mutations == "LEGMASS"): # increase speed by 25%
			enemy.speed = (enemy.speed * .25) + enemy.speed
			enemy.mutationList[index] = "LEGMASS"
		elif (mutations == "GROWTHBOOST"): # decrease the requirements for spawning creatues by 10%
			growthrate =  growthrate - (growthrate * .10)
			enemy.mutationList[index] = "GROWTHBOOST"
		elif (mutations == "SHRINK"): # increase in speed and dmg (15%) but less hp (15%)
			enemy.hp = enemy.hp - (enemy.hp * .15)
			enemy.speed = enemy.speed + (enemy.speed * .15)
			enemy.dmg = enemy.dmg + (enemy.dmg * .15)
			enemy.mutationList[index] = "SHRINK"
		elif (mutations == "GROWTH"): # increase health and weight (15%) but less speed (15%)
			enemy.hp = enemy.hp + (enemy.hp * .15)
			enemy.speed = enemy.speed - (enemy.speed * .15)
			enemy.weightMax = enemy.weightMax + (enemy.weightMax * .15)
			enemy.mutationList[index] = "GROWTH"
		elif (mutations == "SLIM"): # increase speed and weight but less health (15%)
			enemy.hp = enemy.hp - (enemy.hp * .15)
			enemy.speed = enemy.speed + (enemy.speed * .15)
			enemy.weightMax = enemy.weightMax + (enemy.weightMax * .15)
			enemy.mutationList[index] = "SLIM"
		
func removeMutation(mutation):
	var index = 0
	for i in enemy.mutationList:
		if (enemy.mutationList[i] == mutation):
			index = i
			break
	enemy.mutationList[index] = null
	
	
	
func _on_Area2D_body_entered(body):
	if body.name == "enemy":
		enemy = body
		


func _on_Area2D_body_exited(body):
	enemy = null
