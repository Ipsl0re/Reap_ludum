extends KinematicBody2D

var velocity = Vector2()
var speed = 150

#reset player spawn

func _process(_delta):
	velocity = Vector2()
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
		get_child(0).texture = load("res://farmer/farmer_up.png")
	if Input.is_action_pressed("Down"):
		velocity.y += 1
		get_child(0).texture = load("res://farmer/farmer_down.png")
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		get_child(0).texture = load("res://farmer/farmer_left.png")
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		get_child(0).texture = load("res://farmer/farmer_right.png")
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	pass


func _on_Background_grow():
	self.set_position(Vector2(531, 301))
	pass #reset player's position
