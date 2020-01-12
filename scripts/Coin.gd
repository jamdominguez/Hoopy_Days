extends Node2D

var taken = false

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if not taken: #control to no take the same coin several times while it is free
		taken = true
		$AnimationPlayer.play("die")
		$AudioStreamPlayer2D.play()
		get_tree().call_group("Gamestate", "coin_up")

func die():
	queue_free()
