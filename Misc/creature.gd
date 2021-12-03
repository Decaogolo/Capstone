extends KinematicBody2D

var enemy = null
var move = Vector2.ZERO
var speed = 1

func _physics_process(delta):
	move = Vector2.ZERO
	
	if enemy != null:
		move = position.direction_to(enemy.position) * speed
	else:
		move = Vector2.ZERO
	
	move = move.normalized()
	move = move_and_collide(move)

func _on_Area2D_body_entered(body):
	if body != self:
		enemy = body


func _on_Area2D_body_exited(body):
	pass # Replace with function body.
