extends CharacterBody2D

const MOVE_AMOUNT := 32  # Grid size
const MOVE_SPEED = 4

func input():	
	
	var input = position #gets position class
	input.x = 0
	input.y = 0
	
	if Input.is_action_pressed("move_right"):
		input.x += 1
	elif Input.is_action_pressed("move_left"):
		input.x -= 1
	elif Input.is_action_pressed("move_down"):
		input.y += 1
	elif Input.is_action_pressed("move_up"):
		input.y -= 1
	
	if ( !(input.x == 0 && input.y == 0) ): #if (new_position != position):
		return input

func tick(new_position):
	
	if (new_position.x > position.x):
		position.x += MOVE_SPEED
	elif (new_position.x < position.x):
		position.x -= MOVE_SPEED
	elif (new_position.y > position.y):
		position.y += MOVE_SPEED
	elif (new_position.y < position.y):
		position.y -= MOVE_SPEED

func detect(x,y):
	
	var blocks
	
	if (x == 0 && y == 1):
		blocks = $detectorS.get_overlapping_areas()
	elif (x == 0 && y == -1):
		blocks = $detectorN.get_overlapping_areas()
	elif (x == 1 && y == 0):
		blocks = $detectorE.get_overlapping_areas()
	elif (x == -1 && y == 0):
		blocks = $detectorW.get_overlapping_areas()
	
	if (blocks.size() != 0):
		return blocks[0]
	
	else:
		return null
