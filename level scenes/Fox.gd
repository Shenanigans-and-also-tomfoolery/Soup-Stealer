extends Node3D
#probs some animating needed here desperately but it was created so the dialogue can work
func say_hello():
	var layout = Dialogic.start("res://Dialogues/test.dtl")
	layout.register_character(load("res://Other Stuff/fox.dch"), $".")
# Called when the node enters the scene tree for the first time.

func see_the_shop():
	var layout = Dialogic.start("res://Dialogues/see_the_shop.dtl")
	layout.register_character(load("res://Other Stuff/fox.dch"), $".")



func _on_dialogic_signal(argument:String):
	if argument == "finished_tutorial's_introduction":
		print("Player's done pt 0 of tutorial")
		#Play animation for the first bit of the tutorial
		get_node("../Cutscenes").play("TutorialPt1")
	else:
		if argument == "seen_the_shop":
			print("Player's done pt 1 of tutorial")
			#Play animation for the first bit of the tutorial
			get_node("../Cutscenes").play("cam_normal")

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


