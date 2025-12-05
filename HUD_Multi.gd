extends CanvasLayer
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func update_score_p1(score):
	$ScoreLabelP1.text = "P1: " + str(score)

func update_score_p2(score):
	$ScoreLabelP2.text = "P2: " + str(score)

func show_game_over(p1_score, p2_score):
	var text = ""

	if p1_score > p2_score:
		text = "Game Over\nGuanya el Jugador 1!\nP1: %d   P2: %d" % [p1_score, p2_score]
	elif p2_score > p1_score:
		text = "Game Over\nGuanya el Jugador 2!\nP1: %d   P2: %d" % [p1_score, p2_score]
	else:
		text = "Game Over\nEmpat!\nP1: %d   P2: %d" % [p1_score, p2_score]

	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	yield($MessageTimer, "timeout")

	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")

	$StartButton.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
