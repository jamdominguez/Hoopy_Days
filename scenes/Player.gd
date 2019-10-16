extends KinematicBody2D

var motion = Vector2(0,0)
var UP = Vector2(0,-1)
var SPEED = 1000
var JUMP_SPEED = 3000
var GRAVITY = 300

func _ready():
	pass

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	move_and_slide(motion, UP) #execute motion
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
	
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = - SPEED #move to left
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED #move to right
	else:
		motion.x = 0 #stop move