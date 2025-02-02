extends Node2D

var allowInput = true
var input
var newPos
var detectStage = 0

func _ready():
	newPos = $Player.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (allowInput):
		input = $Player.input()
		
		if (input != null):
			
			newPos = $Player.position
			newPos.x += 32 * input.x
			newPos.y += 32 * input.y

			if ($Player.detect(input.x,input.y) != null):
				$Player.detect(input.x,input.y).mine()
			
			
			allowInput = false
		
	else:
		worldTurn()

func worldTurn():
	
	#animate player
	if ($Player.position != newPos):
		$Player.tick(newPos)
		return
	
	var gravity = 1	
	#gravity
	if ($Player.detect(0,gravity) == null):
		newPos.y += (32 * gravity)
		return
	
	var mobs = get_tree().get_nodes_in_group("monsters")
	for mob in mobs:
		var result = mob.tick()
	
	allowInput = true
	input = null
	newPos = $Player.position
