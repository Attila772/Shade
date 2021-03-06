extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called when the node enters the scene tree for the first time.
func _process(delta):
	var player = get_parent().get_node("YSort").get_node("Dudes").get_node("Player")
	var vektor = player.position - position
	var x = abs(vektor.x)
	var y = abs(vektor.y)
	
	
	var dist = pow(pow(x,2)+pow(y,2),0.5)
	if dist < 100:
		
		$Label.visible = true
		if Input.is_action_pressed("interact"):
			visible=false	
			get_parent().get_node("YSort").get_node("Player").Gadget = "Emp"
			get_parent().get_node("YSort").get_node("Player").gadgetpickedup()
	else:
		$Label.visible = false
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
