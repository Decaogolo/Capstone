extends Area2D

var specie = preload("res://BattleSystem/SpecieOne.tscn")
var pos = null

func _ready():
	pass

#func _process(delta):
#	if (pos != null):
#		run(pos)
#
		
func spawn(spawnType, spawnPosition):
	var newSpawn = spawnType.instance()
	add_child(newSpawn)
	newSpawn.global_position = spawnPosition
	#newSpawn.set_process(true)

func run(pos):
	spawn(specie, pos)
