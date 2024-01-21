extends Node

var music : AudioStreamPlayer

func _ready():
	# Charger la musique
	var music_stream : AudioStream = preload("res://musci.mp3")

	# Créer et ajouter un nœud AudioStreamPlayer à la scène
	music = AudioStreamPlayer.new()
	add_child(music)

	# Assigner la musique au lecteur audio
	music.stream = music_stream

	# Lancer la lecture de la musique
	music.play()
