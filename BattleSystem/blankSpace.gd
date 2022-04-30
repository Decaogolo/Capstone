extends StaticBody2D

#var one = preload("res://BattleSystem/SpecieOne.tscn")
var health =  250
var typeName = "blank"
var killedBy = "NA"
#var creature = preload("res://BattleSystem/SpecieOne.tscn")



func _ready():
	#if health == 0:
	pass
	
func _process(delta):
	if health <= 0:
		typeName = "self"
		#spawn(creature, global_position)
		hide()
		queue_free()
#	pass

func spawn(spawnType, spawnPosition):
	var newSpawn = spawnType.instance()
	add_child(newSpawn)
	newSpawn.global_position = spawnPosition
	print("working?")

	
