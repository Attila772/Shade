extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	print("Lenyomva")
	var collide = get_parent().get_node("collide").text
	var speed = get_parent().get_node("speed").text
	var gadget = get_parent().get_node("gadget").text
	var Player = get_parent().get_parent().get_parent().get_node("Test").get_node("Player")
	Player.debug_mode = true
	if !collide=="":
		if collide =="y":
			Player.get_node("CollisionShape2D").disabled = true
		if collide =="n":
			Player.get_node("CollisionShape2D").disabled = false
	
	if !speed=="":
		if speed=="alap":
			Player.speed = 200
		else:
			Player.speed = int(speed)
	
	if gadget =="y":
		Player.MouseNav = true
	else: 
		Player.MouseNav = false
		
	get_parent().get_parent().remove_child(get_parent())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
