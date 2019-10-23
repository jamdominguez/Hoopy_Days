extends KinematicBody2D

var motion = Vector2(0,0)

const UP = Vector2(0,-1)
const SPEED = 1500
const JUMP_SPEED = 3500
const GRAVITY = 150
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.5

var lives = 3

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
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor(): # no apply gravity
		motion.y = 0
	elif is_on_ceiling(): # avoid stay close ceiling, force go donw motion > 0
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()
	
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = - SPEED #move to left
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED #move to right
	else:
		motion.x = 0 #stop move

func animate():
	emit_signal("animate", motion)

func end_game():
	get_tree().change_scene("res://scenes/GameOver.tscn")

func hurt():
	position.y -= 1 # to no stay on floor. apply_gravity no set motion.y = 0 (process function)
	yield(get_tree(), "idle_frame") # wait from a frame
	motion.y -= JUMP_SPEED # jump if hurt
	lives -= 1
	$PainSFX.play()
	if lives < 0:
		end_game()

func boost():
	position.y -= 1 # to no stay on floor. apply_gravity no set motion.y = 0 (process function)
	yield(get_tree(), "idle_frame") # wait from a frame
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER