extends Control

var save_path = "user://save_data.save" # path for save data silly billy - it's actually stored here: C:\Users\YOUR_USERNAME\AppData\Roaming\Godot\app_userdata\SoupStealer-1Apr
var isNew # var for the checks if player is new (done below)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect3/AnimationPlayer").play("Fade_In_Title") # Just plays an animation that fades in the title cuz it looks weird if it just clips to the title
	
	
	# Check if the player has save data already
	var PlayButton = get_node("NewButton") # save this node as a variable cuz im lazy
	if FileAccess.file_exists(save_path):
		PlayButton.set_text("Continue")
		isNew = false
		print("Player continuing")
	else:
		PlayButton.set_text("New Game")
		isNew = true
		print("Player is new")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_node("AudioStreamPlayer").playing == false:
		get_node("AudioStreamPlayer").play()



func _on_new_button_pressed(): #I named this before making it fancy srry
	if isNew == true:
		var file = FileAccess.open(save_path, FileAccess.WRITE) # Opens the save data. Opening in write mode automagically erases all other contents
		file.store_line("Pls don't cheat :))))") #Saves this line
		file.READ
		print("Created save data @ ", save_path)
		get_tree().change_scene_to_file("res://level scenes/lvl1.tscn")
	else:
		#load save_data
		#we dont have any data to load so its blank lmao
		#var file = FileAccess.open(save_path, FileAccess.WRITE) # Opens the save data
		load_save_data()
		pass



func load_save_data():
	# ridiculously inneficient :)
	var file = FileAccess.open(save_path, FileAccess.READ) #opens the save file @ the path
	var content = file.get_line()
	print(content)
	
	if content == "Pls don't cheat :))))": #Yep, that's right. We go through EVERY SINGLE LEVEL until we get the right one! :))
		#load lvl 1
		print("Loading lvl 1")
		get_tree().change_scene_to_file("res://level scenes/lvl1.tscn")
	else:
		content = file.get_as_text()
		if content == "Day 1 Passed!":
			#load level 2
			print("Loading lvl 2")
		else:
			#load other levels
			print("Loading other level(s)")
		pass
		


func _on_options_pressed():
	get_node("OptionsMenu/AnimationPlayer").play("options") #play the opening options animation - the close anim is located in the actual options
	pass # Replace with function body.
