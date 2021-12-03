extends Area2D

var water = null

func canSeeWater():
	return water != null




func _on_WaterDetection_body_entered(body):
	if body.name == "Water":
		water = body



func _on_WaterDetection_body_exited(body):
	water = null
