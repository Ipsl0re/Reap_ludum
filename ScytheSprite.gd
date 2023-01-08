extends AnimatedSprite

var last_swing = "r"

func _ready():
	$Area2D/CollisionShape2D.set_deferred("disabled", true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(_event):
	if !is_playing():
		if Input.is_action_just_pressed("Swing_left"):
			self.play("l_swing")
			self.set_frame(0)
			$Area2D/CollisionShape2D.set_deferred("disabled", false)
			if last_swing == "l":
				print(self.get_rotation())
				self.set_rotation_degrees((self.get_rotation_degrees()) - 90)
			last_swing = "l"
			$Swish.play()
		if Input.is_action_just_pressed("Swing_right"):
			self.play("r_swing")
			self.set_frame(0)
			$Area2D/CollisionShape2D.set_deferred("disabled", false)
			if last_swing == "r":
				self.set_rotation_degrees((self.get_rotation_degrees()) + 90)
			last_swing = "r"
			$Swoosh.play()
	pass

func _on_Animation_animation_finished():
	self.stop()
	self.set_frame(7)
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
