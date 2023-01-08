extends Node2D


var angle = 180
var points = 0
var no_music = false
signal grow

func _ready():
	get_tree().paused = true
	
func _on_Button_pressed():
	$Menu/Boop.play()
	$Tutorial.hide()
	$Menu.hide()
	$Menu/Title.hide()
	$Menu/Scoretag.hide()
	$Music.stream = load("res://Harvest_Play.wav")
	get_tree().paused = false
	points = 0
	$Sun/Timer.start()

func _process(_delta):
	angle = ($Sun/Timer.get_time_left()) * 4.5
	$Sun.set_rotation_degrees(angle - 180)
	
func _on_Wheat_hit():
	points += 1
	$Score.set_text(str(points))


func _on_Timer_timeout():
	$Sun/Chime.play()
	$Menu.texture = load("res://end.png")
	$Menu/Scoretag/Score.set_text(str(points))
	$Menu.show()
	$Menu/Scoretag.show()
	$Music.stream = load("res://Harvest_Theme.wav")
	emit_signal("grow")
	get_tree().paused = true


func _on_Button2_pressed():
	$Menu/Boop.play()
	$Menu/Title.hide()
	$Tutorial.show()
	$Tutorial/Demo.set_frame(0)
	$Tutorial/Demo2.set_frame(0)
	$Tutorial/Mouse.set_frame(0)
	$Tutorial/Mouse2.set_frame(0)


func _on_AudioStreamPlayer_finished():
	if !no_music:
		$Music.play()


func _on_Button3_pressed():
	if !no_music:
		$Music.stop()
		$Control/Note.texture = load("res://music_off.png")
		no_music = true
	else:
		$Music.play()
		$Control/Note.texture = load("res://music.png")
		no_music = false
