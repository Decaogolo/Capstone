"""extends KinematicBody2D

export(float) var maxHealth = 5
export(float) var health = maxHealth
export(float) var attack = 2
export(float) var maxWalkSpeed = 16

#var water = preload("res://Scenes/WaterSource.tscn")
var enemy = null
var water = null

# vectors
var targetPosition = Vector2.ZERO
var velocity = Vector2.ZERO
var direction = Vector2(0, 1)

# child node
#onready var anim = $Anim
onready var enemyDetection = $EnemyDetection
onready var waterDetection = $WaterDetection
onready var effect = $Effect

enum STATES {WATER, FOOD, CHASE, HURT, DIE}
export(STATES) var state = 1

var knockbackDirection = Vector2.ZERO
var knockbackForce = 16.0
var knockbackDuration = 0.4

func _ready():
	_change_state(STATES.CHASE)
	

func _change_state(newState):
	if newState == STATES.WATER:
		pass
	elif newState == STATES.CHASE:
		# find Enemy and Go for it
		pass
	state = newState

func move(targetPosition, maxSpeed):
	direction = (targetPosition - position).normalized()
	var desiredVelocity = direction * maxSpeed
	velocity = desiredVelocity - velocity
	return position.direction_to(targetPosition).normalized()

func takeDamage(dmg, knockDir, knockForce):
	state = STATES.HURT
	health -= dmg
	var creaturePosition = global_position
	effect.interpolate_property(self, "position", creaturePosition, 
	creaturePosition + knockForce * knockDir, 
	knockbackDuration, Tween.TRANS_QUART, Tween.EASE_OUT)
	effect.start()
	if health <= 0:
		state = STATES.DIE

func _on_Hurtbox_area_entered(area):
	var attacker = area.get_parent()
	var dmgValue = attacker.attack # create one in enemy
	
	# knockback
	var knockDir = (global_position - attacker.global_position).normalized()
	
	takeDamage(dmgValue, knockDir, knockbackForce)


func seekPlayer():
	if enemyDetection.canSeePlayer():
		_change_state(STATES.CHASE)

func seekWater():
	if waterDetection.canSeeWater():
		_change_state(STATES.WATER)
		
# process
func _physics_process(delta):
	var move = Vector2.ZERO
	match state:
		STATES.WATER:
			if water:
				if direction.y == -1 and direction.x == 0:
					move(water.global_position, maxWalkSpeed)
				elif direction.x <= 0 and direction.y > 0:
					move(water.global_position, maxWalkSpeed)
				elif direction.x > 0 and direction.y >= 0:
					move(water.global_position, maxWalkSpeed)
				elif direction.x < 0 and direction.y <= 0:
					move(water.global_position, maxWalkSpeed)
					
				var direction = (water.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * maxWalkSpeed, 120 * delta)
		STATES.CHASE:
			#var enemy = enemyDetection.enemy
			if enemy:
				if direction.y == -1 and direction.x == 0:
					move(enemy.global_position, maxWalkSpeed)
				elif direction.x <= 0 and direction.y > 0:
					move(enemy.global_position, maxWalkSpeed)
				elif direction.x > 0 and direction.y >= 0:
					move(enemy.global_position, maxWalkSpeed)
				elif direction.x < 0 and direction.y <= 0:
					move(enemy.global_position, maxWalkSpeed)
					
				var direction = (enemy.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * maxWalkSpeed, 120 * delta)
			else:
				_change_state(STATES.WATER)
		STATES.DIE:
			state = null
			velocity = Vector2.ZERO
			# fade out body and queue free
			fadeOutBody()
			
	velocity = move_and_slide(velocity)

func fadeOutBody():
	effect.interpolate_property(self, 'modulate', Color(1,1,1,1), 
	Color(1,1,1,0), 0.6, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	effect.start()



func _on_Effect_tween_completed(object, key):
	if key == ":modulate":
		queue_free()

func canSeePlayer():
	return enemy != null
	
func _on_EnemyDetection_body_entered(body):
		if body.name == "Enemy":
			enemy = body


func _on_EnemyDetection_body_exited(body):
	enemy = null

func canSeeWater():
	return water != null


func _on_WaterDetection_body_entered(body):
		if body.name == "Water":
			water = body


func _on_WaterDetection_body_exited(body):
	water = null
"""
