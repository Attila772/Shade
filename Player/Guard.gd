extends KinematicBody2D

var movement = Vector2(1,1)
var speed = 125
var animation
var anim_mode="Walk"
var angle
var move_direction = "S"
var center = position
var radius = 500
var color = Color(1.0, 0.0, 0.0,0.2)
var angle_from = 0 
var angle_to = 90
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 31 :
		var raycast = RayCast2D.new()
		raycast.enabled=true
		raycast.add_exception(get_parent().get_node("Player"))
		add_child(raycast)

func movementloop():
	movement = $'../../Navigation2D/Line2D'.points[1]-self.position
	angle = rad2deg(Vector2(0,-1).angle_to(movement))
	if (angle>-22.5 && angle<22.5):
		move_direction="N"
	if (angle>22.5 && angle<67.5):
		move_direction="NE"
	if (angle>67.5 && angle<112.5):
		move_direction="E"
	if (angle>112.5 && angle<157.5):
		move_direction="SE"
	if (angle>157.5 || angle<-157.5):
		move_direction="S"
	if (angle>-157.5 && angle<-112.5):
		move_direction="SW"
	if (angle>-112.5 && angle<-67.5):
		move_direction="W"
	if (angle>-67.5 && angle<-22.5):
		move_direction="NW"
	movement=movement.normalized()*speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movementloop()
	move_and_slide(movement)
	
func _process(delta):
	Animationloop()
	Organise_RayCasts()
	update()
func Animationloop():
	animation = "Walk_" + move_direction
	$AnimationPlayer.play(animation)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(31):
		var angle_point
		var raycast =get_node("@@"+String(i+2))
		if raycast.is_colliding():
			angle_point = raycast.get_collision_point()-position
		else :
			angle_point = raycast.cast_to
		points_arc.push_back(angle_point)
	draw_polygon(points_arc, colors)
	
func _draw():
   draw_circle_arc_poly( center, radius, angle_from, angle_to, color )

func Organise_RayCasts():
	for i in 31:
		var RayCastName="@@"+String(i+2)
		var raycast = get_node(RayCastName)
		raycast.cast_to = (movement.normalized().rotated(deg2rad((i-15)*3))*500)
