extends KinematicBody2D

var movement = Vector2(1,1)
var speed = 100
var animation
var anim_mode="Walk"
var angle
var dir = Vector2(1,1)
var move_direction = "S"
var timer
var timer_base
var sus_timer
var sus_timer_base
var turn_around_timer
var turn_around_timer_base
var on_alert = false
var FOW
var Line
var FOW_location = preload("res://FOW/FOW.tscn")
var Line_location = preload("res://Line/Line2D.tscn")
var Line_name
var player
var last_known_pos
var path_index=1


var softdialog = load("res://Ui Stuff/SoftDialogBox.tscn").instance()
var dialog = ["Guard",3,"YOU VIOLATED THE LAW"]
var Dialogs = [dialog]


onready var Patrol_path = get_parent().get_parent().get(str(self.name))
onready var Check_locations = get_parent().get_parent().get("checklocations")
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
	match Patrol_path[0]:#sets difficulty
		0:
			difficulty= Pista
			timer = 1
			timer_base = 1
			sus_timer = 2
			sus_timer_base= 2 
			turn_around_timer=4
			turn_around_timer_base=4 
		1:
			difficulty= Security
			timer = 1
			timer_base = 1
			sus_timer = 2
			sus_timer_base= 2 
			turn_around_timer=4
			turn_around_timer_base=4 
		2:
			difficulty= Military
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



func _process(delta):#State machine LETÉPEM A ***** HA HOZZÁNYÚLSZ (ez hosszú lesz baszki)
	match difficulty:
		Pista:
			match state:
				Patrol:
					if path_index == Patrol_path.size():#resets patrol route 
						path_index=1 
					set_destination(Patrol_path[path_index])#sets this to Line as destination
					if (position - Patrol_path[path_index]).length()<50: # checks how close guard is to destination (-50 because it cant reach exact coordinate) 
						path_index += 1# if guard reach destination updates it to next coordinate on patrol route
					if FOW.player_check():
						timer -= delta
						if timer<0:
							change_to_sus()


				Sus:
					set_destination(last_known_pos)
					speed = 0
					sus_timer -= delta
					if FOW.player_check():
						timer -= delta
						if timer < 0:
							change_to_chase()
					if sus_timer < 0:
						change_to_patrol()
					


				Search:
					set_destination(last_known_pos)
					if FOW.player_check():
						set_destination(last_known_pos)
						change_to_chase()
					if (position - last_known_pos).length()<50:
						speed=0
						look_around(delta)


				Chase: 
					if FOW.player_check():
						set_destination(last_known_pos)#chase player
					else :
						change_to_search()


		Security:
			match state:
				Patrol:
					if path_index == Patrol_path.size():#resets patrol route 
						path_index=1 
					set_destination(Patrol_path[path_index])#sets this to Line as destination
					if (position - Patrol_path[path_index]).length()<50: # checks how close guard is to destination (-50 because it cant reach exact coordinate) 
						path_index += 1# if guard reach destination updates it to next coordinate on patrol route
					if FOW.player_check():
						timer -= delta
						if timer<0:
							change_to_sus()


				Sus:
					set_destination(last_known_pos)
					speed = 50
					sus_timer -= delta
					if FOW.player_check():
						timer -= delta
						if timer < 0:
							change_to_chase()
					if sus_timer < 0:
						change_to_patrol()


				Search:
					last_known_pos=get_closest_check_location()
					set_destination(last_known_pos)
					if FOW.player_check():
						set_destination(last_known_pos)
						change_to_chase()
					if (position - last_known_pos).length()<50:
						speed=0
						look_around(delta)


				Chase: 
					if !on_alert:
						on_alert=true
					if FOW.player_check():
						set_destination(last_known_pos)#chase player
					else :
						alert_all()
						change_to_search()



func Animationloop(): #Plays animation pretty self-explanatory
	animation = "Walk_" + move_direction
	$AnimationPlayer.play(animation)



func set_destination(destination):#Sets destination for Line for pathfinding
	Line.destination = destination



func look_around(delta): # guard looks around
	turn_around_timer-=delta
	if turn_around_timer > 3 :
		set_destination(position-(position-last_known_pos).rotated(deg2rad(-90*(4-turn_around_timer))))
		
	if turn_around_timer < 3 && turn_around_timer > 2 :
		set_destination(position-(position-last_known_pos).rotated(deg2rad(-90*(turn_around_timer-2))))
		
	if turn_around_timer < 2 && turn_around_timer > 1 :
		set_destination(position-(position-last_known_pos).rotated(deg2rad(90*(abs(turn_around_timer-2)))))
	
	if turn_around_timer < 1 :
		set_destination(position-(position-last_known_pos).rotated(deg2rad(90*(turn_around_timer))))
	
	if turn_around_timer < 0 :
		change_to_patrol()



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



func change_to_sus():
	if !on_alert:
		timer = timer_base
	else :
		timer=timer_base/2
	timer = timer_base
	FOW.color=Color(1,1,0,0.2)
	state=Sus



func change_to_chase():
	SoftDialog(Dialogs)
	sus_timer=sus_timer_base
	turn_around_timer= turn_around_timer_base
	speed = 125
	FOW.color=Color(1,0,0,0.2)
	state = Chase



func change_to_search():
	speed = 100
	FOW.color= Color(1,1,0,0.2)
	state = Search



func change_to_patrol():
	sus_timer = sus_timer_base
	speed = 100
	if on_alert&& difficulty != Pista:
		timer = timer_base/2
		FOW.color=Color(1,1,0,0.2)
	else :
		timer=timer_base
		FOW.color=Color(0,1,0,0.2)
	state = Patrol



func alert_all():
	var dudes = get_tree().get_nodes_in_group("dudes")
	for i in dudes:
		if i.name!= "Player":
			i.on_alert=true
			i.timer = timer_base/2
			i.FOW.color=Color(1,1,0,0.2)



func SoftDialog(DialogString):
	get_parent().get_parent().get_node("Camera2D").add_child(softdialog)
	softdialog.dialog(Dialogs)


func get_closest_check_location():
	var closest= Check_locations[0]
	for i in Check_locations:
		if (i - last_known_pos).length() < (closest - last_known_pos).length():
			closest = i
	return closest
