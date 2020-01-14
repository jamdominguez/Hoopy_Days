extends Node2D

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()

func fire():
	#it is necessary add a scene, no a string
	if not timeout:
		print("fire")
		$Sprite/RayCast2D.add_child(load("res://scenes/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true

func _on_Timer_timeout():
	print("timeout!")
	timeout = false