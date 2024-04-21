extends CharacterBody3D
# This is the fake player used in cutscenes and stuff cuz i'm not smart enough to fix the player movement

func _physics_process(delta):

	get_node("topless_guy/AnimationPlayer").play("Idle")
