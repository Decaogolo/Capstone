extends PopupDialog

onready var pop = get_node("popnum")
onready var hp = get_node("healthnum")
onready var dmg = get_node("dmgnum")
onready var speed = get_node("speednum")
onready var weight = get_node("weightnum")


func _ready():
	pass # Replace with function body.

func setText():
	var pops = Nest.population
	pop.text = str(pops)
	hp.text = str(Player.hp)
	dmg.text = str(Player.dmg)
	speed.text = str(Player.speed)
	weight.text = str(Player.weightMax)

func _on_Button3_pressed():
	setText()
	popup()
