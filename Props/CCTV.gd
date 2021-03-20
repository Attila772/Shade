extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FOW_location = preload("res://FOW/FOW.tscn")
var FOW
var animation
var dir
var viewDir=Vector2(0,-1)
var viewStart
var viewEnd
var reversal=false
var currentAngle 
var player
onready var CCTV = get_parent().get_parent().get(str(self.name))
enum{
	Patrol
	Chase 
	Search
	Sus
}
var state = Patrol

func _process(delta):
	AnimationLoop()
	match state:
		Patrol:
			AnimationLoop()
			changeRotation()
		Chase : 
			AnimationLoop()
			chase_loop()
			
func AnimationLoop():
	if -15<currentAngle && currentAngle<15:
		animation="N"
#		dir = Vector2(0,-1).rotated(deg2rad(0))
	if 15<currentAngle && currentAngle<45:
		animation="NNE"
#		dir = Vector2(0,-1).rotated(deg2rad(30))
	if 45<currentAngle && currentAngle<75:
		animation="NEE"		
#		dir = Vector2(0,-1).rotated(deg2rad(60))
	if 75<currentAngle && currentAngle<105:
		animation="E"
#		dir = Vector2(0,-1).rotated(deg2rad(90))
	if 105<currentAngle && currentAngle<135:
		animation="SEE"	
#		dir = Vector2(0,-1).rotated(deg2rad(120))
	if 135<currentAngle && currentAngle<165:
		animation="SSE"
#		dir = Vector2(0,-1).rotated(deg2rad(150))
	if 165<currentAngle || currentAngle<-165:
		animation="S"
#		dir = Vector2(0,-1).rotated(deg2rad(180))
	if -15>currentAngle && currentAngle>-45:
		animation="NNW"			
#		dir = Vector2(0,-1).rotated(deg2rad(-30))
	if -45>currentAngle && currentAngle>-75:
		animation="NWW"		
#		dir = Vector2(0,-1).rotated(deg2rad(-60))
	if -75>currentAngle && currentAngle>-105:
		animation="W"
#		dir = Vector2(0,-1).rotated(deg2rad(-90))
	if -105>currentAngle && currentAngle>-135:
		animation="SWW"	
#		dir = Vector2(0,-1).rotated(deg2rad(-120))
	if -135>currentAngle && currentAngle>-165:
		animation="SSW"	
#		dir = Vector2(0,-1).rotated(deg2rad(-150))
	$AnimationPlayer.play(animation)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	viewStart = CCTV[0]
	viewEnd = CCTV[1]
	player = get_parent().get_node("Player")
	FOW= FOW_location.instance()
	FOW.name = "FOW_of_"+str(self.name)
	FOW.parent_body = self
	FOW.is_camera = true
	viewDir=viewDir.rotated(viewStart)
	dir= viewDir
	currentAngle=viewStart
	get_parent().get_parent().get_node("Floor").add_child(FOW)
	# Replace with function body.
func changeRotation():
	if reversal:
		viewDir=Vector2(0,-1).rotated(deg2rad(currentAngle))
		currentAngle-=1
		if currentAngle==viewStart:
			reversal=false
	else:	
		viewDir=Vector2(0,-1).rotated(deg2rad(currentAngle))
		currentAngle+=1
		if currentAngle==viewEnd:
			reversal=true
	dir = viewDir
func chase_loop():
	viewDir=player.position-position
	dir = viewDir

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
