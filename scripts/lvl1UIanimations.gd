extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#self.play("day_one")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("../TutorialMusic").playing == false:
		get_node("../TutorialMusic").play()
	pass
