extends KinematicBody2D

var movement = Vector2(1,1)
var speed = 100
var animation
var anim_mode="Walk"
var angle
var dir = Vector2(1,1)
var move_direction = "S"
var timer = 1
var sus_timer = 2
var on_alert = false
var FOW
var Line
var FOW_location = preload("res://FOW/FOW.tscn")
var Line_location = preload("res://Line/Line2D.tscn")
var Line_name
var player
var last_known_pos
var path_index=0
onready var Patrol_path = get_parent().get_parent().get(str(self.name))
enum {
	Patrol
	Sus
	Search
	Chase
}
var state = Patrol
enum {
	Pista
	Security
	Military
}
var difficulty = Pista



func _ready(): # creates FOW and Line for Guard DONT TOUCH!
	player = get_parent().get_node("Player")
	FOW= FOW_location.instance()
	Line = Line_location.instance()
	FOW.parent_body = self
	FOW.name = "FOW_of_"+str(self.name)
	Line_name = "Line_of_"+str(self.name)
	Line.name = Line_name
	Line.guard= self
	set_destination(Patrol_path[path_index])
	get_parent().get_parent().get_node("Floor").add_child(FOW)
	get_parent().get_parent().get_node("Navigation2D").add_child(Line)



func _physics_process(delta):#movement + animation
	movementloop()
	move_and_slide(movement)
	Animationloop()



func _process(delta):#State machine LETÉPEM A ***** HA HOZZÁNYÚLSZ
	match difficulty:
		Pista:
			match state:
				Patrol:
					if path_index == Patrol_path.size():#resets patrol route 
						path_index=0 
					set_destination(Patrol_path[path_index])#sets this to Line as destination
					if (position - Patrol_path[path_index]).length()<50: # checks how close guard is to destination (-50 because it cant reach exact coordinate) 
						path_index += 1# if guard reach destination updates it to next coordinate on patrol route
					if FOW.player_check():
						timer -= delta
						if timer<0:
							timer = 1
							FOW.color=Color(1,1,0,0.2)
							state=Sus


				Sus:
					set_destination(last_known_pos)
					speed = 0
					sus_timer -= delta
					if FOW.player_check():
						timer -= delta
						if timer < 0:
							sus_timer=2
							speed = 125
							FOW.color=Color(1,0,0,0.2)
							state = Chase
					if sus_timer < 0:
						sus_timer = 2
						speed = 100
						timer = 1
						FOW.color=Color(0,1,0,0.2)
						state = Patrol
					


				Search:
					if FOW.player_check():
						set_destination(last_known_pos)
						FOW.color=Color(1,0,0,0.2)
						state = Chase
					set_destination(last_known_pos)
					if (position - last_known_pos).length()<50:
						look_around() # does nothing for now


				Chase: 
					if FOW.player_check():
						set_destination(last_known_pos)#chase player
					else :
						speed = 100
						FOW.color= Color(1,1,0,0.2)
						state = Search



func Animationloop(): #Plays animation pretty self-explanatory
	animation = "Walk_" + move_direction
	$AnimationPlayer.play(animation)



func set_destination(destination):#Sets destination for Line for pathfinding
	Line.destination = destination



func look_around(): # guard looks around
	if FOW.player_check():
		FOW.color= Color(1,0,0,0.2)
		state = Chase
	else :
		timer = 1
		FOW.color= Color(0,1,0,0.2)
		state = Patrol
		



func movementloop(): # determines movement from Line 
	movement = $'../../Navigation2D'.get_node(Line_name).points[1]-self.position
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
	dir = movement # FOW uses this to get direction
	movement=movement.normalized()*speed
