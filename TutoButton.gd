extends Node2D

var action_performed = false

func _ready():
	$Button.connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	if not action_performed:
		# Effectuez l'action souhaitée ici
		print("Action effectuée!")

		# Masquer les nœuds Tuto et Button (remplacez par les noms corrects)
		$Tuto.hide()
		$Button.hide()

		action_performed = true
