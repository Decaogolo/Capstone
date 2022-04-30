extends Node2D

onready var menu = get_node("SelectionMenu")
var timeScale = 0
var years = 0
var mutations = ["CLAWS", "SCALES", "MUSCLEMASS", "LEGMASS", "GROWTHBOOST", "SHRINK", "GROWTH", "SLIM"]
var enemyNest = NestEnemySpawner
var playerNest = Nest
var selectionValid = false
var randomSelection = [null, null, null, null]

onready var SAVE_KEY: String = "party_member_" + name

func _ready():
	timeScale += 1
	#playerChoose()

func _process(delta):
	#print(timeScale)
	#print(years)
	#if (years == 0):
	#	playerChoose()
	timeScale += 1
	if (timeScale == 200):
		years += 1
		timeScale = 0
	if (years == 10):
		if (Enemy.mutationSize != 8):
			randomEnemyMutation()
		playerChoose()
		years = 0
		#print("working")

func spawn(spawnType, spawnPosition):
	var newSpawn = spawnType.instance()
	add_child(newSpawn)
	newSpawn.global_position = spawnPosition
	newSpawn.global_position.x += 15
	newSpawn.global_position.y += 25

func randomEnemyMutation():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var val = rng.randi_range(0, 7)
	enemyNest.addMutations(mutations[val])
	

func playerChoose():
	if (Player.mutationSize == 8):
		print(Player.mutationSize)
		playerRemove()
	else:
		for i in 4:
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var val = rng.randi_range(0, 7)
			randomSelection[i] = mutations[val]
		SelectionMenu.popup_centered()
		SelectionMenu.setText()
		#get_tree().paused = true
		#print("wohoo")


func playerRemove():
	RemoveMenu.popup_centered()
	RemoveMenu.setText()

func save(save_game : Resource):
	save_game.data[SAVE_KEY] = {
		#'experience': experience,
		'health': Player.hp,
		#'mana': stats.mana,
	}
