extends Node2D
var parent_body
var center = Vector2(0,0)
var radius = 500
var color = Color(0.0, 1.0, 0.0,0.2)
var angle= 90
var movement = Vector2(1,1)
var got_track = false
var is_camera = false
var dudes
enum {
	Patrol
	Sus
	Search
	Chase
	}



func _ready():#creates the raycasts and adds the guards as exception
	dudes = get_tree().get_nodes_in_group("dudes")
	position = parent_body.position
	movement = parent_body.dir
	for i in 31 :
		var raycast = RayCast2D.new()
		raycast.enabled=true
		for j in dudes:
			if !j.name=="Player":
				raycast.add_exception(j)
		raycast.name = String(i)
		add_child(raycast)



func _process(delta):
	position = parent_body.position
	movement = parent_body.dir
	Organise_RayCasts()
	update()



func Organise_RayCasts():# organizes the raycasts to match the movement direction DONT TOUCH!
	for i in 31:
		var RayCastName=String(i)
		var raycast = get_node(RayCastName)
		raycast.cast_to = (movement.normalized().rotated(deg2rad((i-15)*angle/30))*radius)



func _draw(): # Built in function gets called in Update()
   draw_circle_arc_poly(center, radius, color )



func draw_circle_arc_poly(center, radius ,color):# Draws the FOW polygon from raycast collision points DONT TOUCH
	var points_arc = PoolVector2Array()
	var colors = PoolColorArray([color])
	points_arc.push_back(center)
	for i in range(31):
		var angle_point
		var raycast =get_node(String(i))
		if raycast.is_colliding():
			angle_point = raycast.get_collision_point()-global_position
		else :
			angle_point = raycast.cast_to
		points_arc.push_back(angle_point)
	draw_polygon(points_arc, colors)



func player_check(): # Checks if raycasts collide with player and updates last known position, called in ParentBody DONT TOUCH!
	for i in range (31):
		var raycast =get_node(String(i))
		if raycast.is_colliding() && raycast.get_collider()==parent_body.player:
			parent_body.last_known_pos = parent_body.player.position
			return true
