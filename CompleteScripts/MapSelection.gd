extends MarginContainer

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://CompleteScene/MapOne.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://CompleteScene/MapTwo.tscn")
