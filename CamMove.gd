extends Camera2D

# NodePath vers le nœud "Mourio" (Node2D)
var mourio_path : NodePath = "/root/Node2D/Mourio"
var mourio : KinematicBody2D

# Sensibilité de suivi de la caméra
var follow_speed : float = 5.0

# Variable pour indiquer si la caméra doit suivre le joueur
var is_following : bool = false

func _ready():
	# Charger le nœud "Mourio" à partir du NodePath
	mourio = get_node(mourio_path)

	if mourio == null:
		print("Erreur: Impossible de charger le nœud Mourio.")
		return
	else:
		print("Caméra prête à suivre Mourio.")

	# Récupérer le bouton à partir du NodePath
	var button = get_node("/root/Node2D/Button")

	# Vérifier si le bouton a été trouvé
	if button == null:
		print("Erreur: Impossible de trouver le bouton.")
		return

	# Connecter le signal "pressed" du bouton à la fonction "_on_button_pressed"
	button.connect("pressed", self, "_on_button_pressed")

func _process(delta):
	# Vérifier si la caméra doit suivre le joueur
	if is_following:
		# Vérifier si le nœud Mourio est nul
		if mourio == null:
			print("Erreur: Le nœud Mourio est nul.")
			return

		# Obtenir la position globale du nœud Mourio
		var mourio_position = mourio.global_position

		# Calculer la nouvelle position de la caméra en interpolant la position de Mourio
		var new_position = global_position.linear_interpolate(mourio_position, follow_speed * delta)

		# Calculer l'offset entre la position de la caméra et la position de Mourio
		var offset = new_position - global_position

		# Définir l'offset pour suivre Mourio
		offset.x = round(offset.x)  # Optionnel : arrondir pour éviter les petits tremblements en position X
		offset.y = round(offset.y)  # Optionnel : arrondir pour éviter les petits tremblements en position Y
		set_offset(get_offset() + offset)

func _on_button_pressed():
	# Lancer ou arrêter le suivi de la caméra lorsque le bouton est cliqué
	print("Bouton cliqué. Suivre ou arrêter de suivre le joueur.")
	is_following = !is_following  # Inverser la valeur de la variable
	if is_following:
		set_process(true)  # Activer le processus de la caméra
	else:
		set_process(false)  # Désactiver le processus de la caméra
