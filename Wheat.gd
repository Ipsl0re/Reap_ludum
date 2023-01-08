extends Area2D

signal hit

func _on_Wheat_area_entered(_area):
	$Wheat.texture = load("res://wheat_dead.png")
	$Wheat.set_offset(Vector2(0, 8))
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	$Timer.start(randi() % 12 + 6)


func _on_Timer_timeout():
	$Wheat.texture = load("res://wheat.png")
	$Wheat.set_offset(Vector2(0, 0))
	$CollisionShape2D.set_deferred("disabled", false)
