extends KinematicBody2D

# Fonction appelée lorsque Mourio entre en collision avec un autre objet
func _on_Mourio_body_entered(body):
	# Vérifiez si l'objet en collision est nommé "Gumba"
	if body.is_in_group("/root/Node2D/FinishGumga"):
		# Affichez la scène GameOver
		get_tree().change_scene("res://GameOver.tscn")
