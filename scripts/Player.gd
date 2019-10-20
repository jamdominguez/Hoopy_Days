extends KinematicBody2D

var motion = Vector2(0,0)
var UP = Vector2(0,-1)
var SPEED = 1500
var JUMP_SPEED = 3500
var GRAVITY = 150

signal animate

func _ready():
	pass

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP) #execute motion
	
func apply_gravity():
	if is_on_floor(): # no apply gravity
		motion.y = 0
	elif is_on_ceiling(): # avoid stay close ceiling, force go donw motion > 0
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
	
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = - SPEED #move to left
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED #move to right
	else:
		motion.x = 0 #stop move

func animate():
	emit_signal("animate", motion)