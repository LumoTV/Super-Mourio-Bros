extends KinematicBody2D

var speed = 200
var jump_speed = 600
var gravity = 20

var velocity = Vector2()
var is_jumping = false

func _ready():
	# Créer un nœud Area2D et l'ajouter en tant qu'enfant de Mourio
	var collision_area = Area2D.new()
	collision_area.name = "CollisionArea"
	add_child(collision_area)

	# Connecter le signal "body_entered" à la fonction "_on_Mourio_body_entered"
	collision_area.connect("body_entered", self, "_on_Mourio_body_entered")

func _physics_process(delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed
	
	if is_on_floor() and is_jumping:
		is_jumping = false

	velocity.y += gravity

	move_and_slide(velocity, Vector2(0, -1))

	# Mettre à jour la position de la caméra
	var camera = get_tree().get_root().get_node("/root/Node2D/Mourio/Camera2D")
	camera.global_position = global_position

func _input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_SPACE and !is_jumping:
		velocity.y = -jump_speed
		is_jumping = true

# Fonction appelée lorsque Mourio entre en collision avec un autre objet
func _on_Mourio_body_entered(body):
	# Vérifiez si l'objet en collision est le Sprite nommé "FinishGumga"
	if body.name == "FinishGumga":
		# Affichez la scène GameOver
		get_tree().change_scene("res://GameOver.tscn")
