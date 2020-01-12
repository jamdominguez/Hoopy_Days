extends Node2D

var lives = 3

func _ready():
	add_to_group("Gamestate")
	pass

func hurt():
	lives -= 1
	$Player.hurt()
	print("lives: ",lives)
	if lives < 0:
		end_game()

func end_game():
	get_tree().change_scene("res://scenes/GameOver.tscn")
