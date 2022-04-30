extends PopupDialog

onready var spin_box = get_node("SpinBox")

#onready var game_saver = get_node("res://CompleteScene/GameSaver.tscn")

func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	popup()


func _on_Button_pressed():
	popup()
	GameSaver.save(spin_box.value)


func _on_Button3_pressed():
	get_tree().change_scene("res://CompleteScene/MainMenu.tscn")
