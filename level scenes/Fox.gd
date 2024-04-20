extends Node3D
#probs some animating needed here desperately but it was created so the dialogue can work
func say_hello():
	var layout = Dialogic.start("res://Dialogues/test.dtl")
	layout.register_character(load("res://Other Stuff/fox.dch"), $".")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


