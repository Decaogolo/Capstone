extends KinematicBody2D

var right = null
var rightPOS = null

func _ready():
	pass # Replace with function body.



func _on_Right_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	right = body
	#print(right)
	rightPOS = body.global_position
	
