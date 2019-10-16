extends KinematicBody2D

var SPEED = 1000
var motion = Vector2(0,0)

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = - SPEED #move to left
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED #move to right
	else:
		motion.x = 0 #stop move
	move_and_slide(motion) #execute motion