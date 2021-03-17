extends Node2D
var parent_body
var center = Vector2(0,0)
var radius = 500
var color = Color(0.0, 1.0, 0.0,0.2)
var angle_from = 0 
var angle_to = 90
var movement = Vector2(1,1)
var breee = true
var got_track = false
var spot_time = 1
var delta_for_timer
var is_camera = false
enum {
	Patrol
	Chase
	Search
}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dudes = get_tree().get_nodes_in_group("dudes")
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

func draw_circle_arc_poly(center, radius ,color):
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])
	var seen = false
	for i in range(31):
		var angle_point
		var raycast =get_node(String(i))
		if raycast.is_colliding():
			angle_point = raycast.get_collision_point()-global_position
		else :
			angle_point = raycast.cast_to
		points_arc.push_back(angle_point)
		draw_line(points_arc[i-1],points_arc[i],Color(0,0,1,1)) 
		if raycast.is_colliding() && raycast.get_collider().name == "Player":
			spot_time -= delta_for_timer
			seen = true
	draw_polygon(points_arc, colors)
	if !is_camera:
		if seen :
			parent_body.Line.state= Chase
			got_track= true
		if got_track && !seen :
			parent_body.Line.state = Search
			got_track=false
	seen= false
func _draw():
   draw_circle_arc_poly(center, radius, color )

func Organise_RayCasts():
	for i in 31:
		var RayCastName=String(i)
		var raycast = get_node(RayCastName)
		raycast.cast_to = (movement.normalized().rotated(deg2rad((i-15)*3))*radius)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_for_timer=delta
	position = parent_body.position
	movement = parent_body.dir
	Organise_RayCasts()
	update()
	
