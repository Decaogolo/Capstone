extends Area2D

var enemy = null

func canSeePlayer():
	return enemy != null


func _on_EnemyDetection_body_entered(body):
	if body.name == "Enemy":
		enemy = body

func _on_EnemyDetection_body_exited(body):
	enemy = null
