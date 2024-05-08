extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("boot_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://important scenes/title_screen.tscn")
	pass # Replace with function body.
