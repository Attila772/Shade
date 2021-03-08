extends StaticBody2D

var selected = false
var dist = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var player = get_parent().get_node("Player")
	var vektor = player.position - position
	var x = abs(vektor.x)
	var y = abs(vektor.y)
	
	
	dist = pow(pow(x,2)+pow(y,2),0.5)
#	print(dist)
	if dist < 100:
		
		$Label.visible = true
		if Input.is_action_pressed("interact"):
			visible=false	
			$Pickup_sound.play()
			$CollisionPolygon2D.disabled = true
			get_parent().get_node("Player").HasTreasure = true
	else:
		$Label.visible = false
		
		
	
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
