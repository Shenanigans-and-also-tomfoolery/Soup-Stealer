extends Node3D

var inShop = false
var weirdBugfix = false
# Called when the node enters the scene tree for the first time.
func _ready():
	inShop = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(inShop)
	if inShop == false: #if we're in the shop, hide the roof
		get_node("Roof").visible = true
	else:
		get_node("Roof").visible = false


func _on_player_entered(CharacterBody3D):
	inShop = true
	get_node("MainFollow Camera").set_priority(0)
	get_node("Top View cam").set_priority(0)
	print("Player entered!")
	
	#change_roof_opacity(0.7)


func _on_area_3d_body_exited(CharacterBody3D):
	inShop = false
	print("Player exited!")
	
	#change_roof_opacity(0)
	
	
func change_roof_opacity(opacity): #this doesn't work atm
	#get all the nodes that make up the roof and set the opacity to them
	var roof_parts = ["Roof/Back Wall2/wall/MeshInstance3D", "Roof/Right Wall2/wall/MeshInstance3D", "Roof/floor2/wall/MeshInstance3D", "Roof/Left wall2/wall/MeshInstance3D"]
	for part_path in roof_parts:
		var part = get_node_or_null(part_path)
		if part and part.mesh and part.mesh.surface_get_material(0):
			var mat = part.mesh.surface_get_material(0).duplicate() # Duplicate the material to avoid changing it globally
			mat.albedo_color = Color(1, 1, 1, opacity)
			part.mesh.surface_set_material(0, mat)
		else:
			print("Node or material not found:", part_path)
