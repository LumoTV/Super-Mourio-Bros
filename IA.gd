extends KinematicBody2D

# Propriétés du mouvement
var speed = 100
var direction = Vector2.RIGHT
var change_direction_interval = 2.0  # Intervalle de temps pour changer de direction (en secondes)

# Compteur pour suivre le temps écoulé depuis le dernier changement de direction
var direction_timer = 0.0

func _process(delta):
	# Mettre à jour le compteur de temps
	direction_timer += delta

	# Si le compteur de temps atteint l'intervalle spécifié, changer de direction
	if direction_timer >= change_direction_interval:
		# Changer aléatoirement la direction (gauche ou droite)
		direction = Vector2(rand_range(-1, 1), 0).normalized()

		# Réinitialiser le compteur de temps
		direction_timer = 0.0

	# Déplacer l'IA dans la direction spécifiée
	move_and_slide(direction * speed * delta)
