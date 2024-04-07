extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_entered(body):
	print("Player entered!")
	change_roof_opacity(0.7)


func _on_area_3d_body_exited(body):
	print("Player exited!")
	change_roof_opacity(0)
	
	
func change_roof_opacity(opacity):
	#get all the nodes that make up the roof and set the opacity to them
	var roof_parts = ["Roof/Back Wall2/wall/MeshInstance3D", "snalalp", "Shop/Roof/floor2/wall/MeshInstance3D", "Roof/Left wall2/wall/MeshInstance3D"]
	for part_path in roof_parts:
		var part = get_node_or_null(part_path)
		if part and part.mesh and part.mesh.surface_get_material(0):
			var mat = part.mesh.surface_get_material(0).duplicate() # Duplicate the material to avoid changing it globally
			mat.albedo_color = Color(1, 1, 1, opacity)
			part.mesh.surface_set_material(0, mat)
		else:
			print("Node or material not found:", part_path)
