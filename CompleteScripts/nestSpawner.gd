extends Node2D

onready var pos = $Position2D
var creature = preload("res://CompleteScene/player.tscn")
var player = null
var enemy = null
var storage = 0
var growthrate = 36

func _process(delta):
	if player != null:
		storage += player.weight
		player.weight = 0
		#print(storage)
	if (storage >= growthrate):
		spawn(creature, player.origins)
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
	if (player.mutationList.size() == 8):
		return null
	else:
		var index = 0
		for i in player.mutationList:
			if (player.mutationList[i] == null):
				index = i
				break
				
		if (mutations == "CLAWS"): # increase damage by 25%
			player.dmg = (player.dmg * .25) + player.dmg
			player.mutationList[index] = "CLAWS"
		elif (mutations == "SCALES"): # increase health by 25%
			player.hp = (player.hp * .25) + player.hp
			player.mutationList[index] = "SCALES"
		elif (mutations == "MUSCLEMASS"): # increase weight maximum by 25%
			player.weightMax = (player.weightMax * .25) + player.weightMax 
			player.mutationList[index] = "MUSCLEMASS"
		elif (mutations == "LEGMASS"): # increase speed by 25%
			player.speed = (player.speed * .25) + player.speed
			player.mutationList[index] = "LEGMASS"
		elif (mutations == "GROWTHBOOST"): # decrease the requirements for spawning creatues by 10%
			growthrate =  growthrate - (growthrate * .10)
			player.mutationList[index] = "GROWTHBOOST"
		elif (mutations == "SHRINK"): # increase in speed and dmg (15%) but less hp (15%)
			player.hp = player.hp - (player.hp * .15)
			player.speed = player.speed + (player.speed * .15)
			player.dmg = player.dmg + (player.dmg * .15)
			player.mutationList[index] = "SHRINK"
		elif (mutations == "GROWTH"): # increase health and weight (15%) but less speed (15%)
			player.hp = player.hp + (player.hp * .15)
			player.speed = player.speed - (player.speed * .15)
			player.weightMax = player.weightMax + (player.weightMax * .15)
			player.mutationList[index] = "GROWTH"
		elif (mutations == "SLIM"): # increase speed and weight but less health (15%)
			player.hp = player.hp - (player.hp * .15)
			player.speed = player.speed + (player.speed * .15)
			player.weightMax = player.weightMax + (player.weightMax * .15)
			player.mutationList[index] = "SLIM"
		
func removeMutation(mutation):
	var index = 0
	for i in player.mutationList:
		if (player.mutationList[i] == mutation):
			index = i
			break
	player.mutationList[index] = null
	
	
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player = body
		


func _on_Area2D_body_exited(body):
	player = null
