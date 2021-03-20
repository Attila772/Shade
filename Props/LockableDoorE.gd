extends StaticBody2D
var IsOpen = false
var dudes
var IsBehind = false
var nearbychar = false
var closedpic = load("res://Resources/DoorEClosed.png")
var openpic = load("res://Resources/DoorEOpened.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	
	nearbychar = false
	dudes = get_tree().get_nodes_in_group("dudes")
	for i in dudes:
		if i.position.y < position.y and i.position.y > position.y-128 and i.position.x> position.x-80 and  i.position.x< position.x+70 :
			IsBehind = true 
		if i.position.distance_to(position) <100:
				print(i.position.distance_to(position))
				nearbychar = true
				if i.name == "Player":
					if get_parent().get_node("Player").haskey == true:
						$Etoopen.visible = true
						if Input.is_action_just_released("interact"):
							IsOpen = true
							$Sprite.texture= openpic
							$CollisionPolygon2D2.disabled = true
					else:
						$find.visible = true
				else:
					IsOpen = true
					$Sprite.texture= openpic
					$CollisionPolygon2D2.disabled = true
		if !nearbychar:
			$Etoopen.visible = false
			$find.visible = false
		if !nearbychar and IsOpen:
			$find.visible = false
			$Etoopen.visible = false
			IsOpen = false
			$Sprite.texture= closedpic
			$CollisionPolygon2D2.disabled=false
			
	if IsBehind :
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1
	IsBehind= false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
