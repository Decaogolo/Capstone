extends PopupDialog

onready var mOne = get_node("MutationOne")
onready var mTwo = get_node("MutationTwo")
onready var mThree = get_node("MutationThree")
onready var mFour = get_node("MutationFour")

func _ready():
	pass

func setText():
	for i in 4:
		var game = GameManager.randomSelection[i]
		#print(game)
		if (i == 0 && game != null):
			mOne.text = "" + game
		if (i == 1 && game != null):
			mTwo.text = "" + game
		if (i == 2 && game != null):
			mThree.text = "" + game
		if (i == 3 && game != null):
			mFour.text = "" + game


func _on_MutationOne_pressed():
	Nest.addMutations(GameManager.randomSelection[0])
	#print(Player.mutationsList[0])
	hide()
	
func _on_MutationTwo_pressed():
	Nest.addMutations(GameManager.randomSelection[1])
	hide()

func _on_MutationThree_pressed():
	Nest.addMutations(GameManager.randomSelection[2])
	hide()

func _on_MutationFour_pressed():
	Nest.addMutations(GameManager.randomSelection[3])
	hide()
