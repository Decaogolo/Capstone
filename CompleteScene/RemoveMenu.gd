extends PopupDialog

onready var mOne = get_node("MutationOne")
onready var mTwo = get_node("MutationTwo")
onready var mThree = get_node("MutationThree")
onready var mFour = get_node("MutationFour")
onready var mFive = get_node("MutationFive")
onready var mSix = get_node("MutationSix")
onready var mSeven = get_node("MutationSeven")
onready var mEight = get_node("MutationEight")

func _ready():
	pass # Replace with function body.

func setText():
	for i in 8:
		var player = Player.mutationsList[i]
		#print(game)
		if (i == 0 && player != null):
			mOne.text = "" + player
		if (i == 1 && player != null):
			mTwo.text = "" + player
		if (i == 2 && player != null):
			mThree.text = "" + player
		if (i == 3 && player != null):
			mFour.text = "" + player
		if (i == 4 && player != null):
			mFive.text = "" + player
		if (i == 5 && player != null):
			mSix.text = "" + player
		if (i == 6 && player != null):
			mSeven.text = "" + player
		if (i == 7 && player != null):
			mEight.text = "" + player



func _on_MutationOne_pressed():
	Nest.removeMutation(Player.mutationsList[0])
	hide()


func _on_MutationTwo_pressed():
	Nest.removeMutation(Player.mutationsList[1])
	hide()

func _on_MutationThree_pressed():
	Nest.removeMutation(Player.mutationsList[2])
	hide()

func _on_MutationFour_pressed():
	Nest.removeMutation(Player.mutationsList[3])
	hide()

func _on_MutationFive_pressed():
	Nest.removeMutation(Player.mutationsList[4])
	hide()

func _on_MutationSix_pressed():
	Nest.removeMutation(Player.mutationsList[5])
	hide()

func _on_MutationSeven_pressed():
	Nest.removeMutation(Player.mutationsList[6])
	hide()

func _on_MutationOne2_pressed():
	Nest.removeMutation(Player.mutationsList[7])
	hide()

func _on_Keep_pressed():
	hide()
