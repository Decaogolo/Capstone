extends Node2D

var player = null
var enemy = null
var creature = preload("res://CompleteScene/player.tscn")

func _ready():
	pass
	
func _process(delta):
	#if (player == null):
	#	print("issue")
	#else:
	#	print("yeah")
	if (player != null):
		player.weight += 12
		#print(player.weight)
		player = null
	if (enemy != null):
		enemy.weight += 12
		#print(enemy.weight)
		#print(enemy.weight)
		enemy = null



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player = body
	if body.name == "enemy":
		enemy = body


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player = null
	if body.name == "enemy":
		enemy = null
