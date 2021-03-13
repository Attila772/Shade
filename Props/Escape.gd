extends StaticBody2D
var count = 0
var selected = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var player = get_parent().get_node("Dudes").get_node("Player")
	var vektor = player.position - position
	var x = abs(vektor.x)
	var y = abs(vektor.y)
	
	
	var dist = pow(pow(x,2)+pow(y,2),0.5)
	print(dist)
	if dist < 100:
		if count ==0:
			if get_parent().get_node("Dudes").get_node("Player").HasTreasure ==true:
				$Label.visible = true
				$Label2.visible = false
				$AudioStreamPlayer2D.play()
				var escape = load("res://Props/EndMenu.tscn").instance()
				
				var camerapos = player.get_position_in_parent()
				escape.rect_position = player.position
				get_parent().get_parent().add_child(escape)
				escape.rect_position+= Vector2(-300,-300)
				
				count +=1
			
	else:
		$Label.visible = false
		$Label2.visible = true
		
		
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
