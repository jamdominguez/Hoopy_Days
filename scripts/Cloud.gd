extends Node2D

func _ready():
	pass

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()

func fire():
	#it is necessary add a scene, no a string
	$Sprite/RayCast2D.add_child(load("res://scenes/Lightning.tscn").instance()) 
	pass
