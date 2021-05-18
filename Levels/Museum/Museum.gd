extends Node2D

var guardlvl = 2
var checklocations=[Vector2(520,-45),Vector2(1400,360),Vector2(2000,90),Vector2(1050,-370),Vector2(1900,-850),Vector2(2900,-250),Vector2(1900,-250),Vector2(2390,-350),Vector2(2750,-750),Vector2(3600,-800),Vector2(2700,-1275),Vector2(3500,-1250)]
var Guard = [guardlvl,5,Vector2(520,-45),Vector2(1400,360)]
var Guard2 = [guardlvl,5,Vector2(2250,-500),Vector2(1450,-100)]
var Guard3 = [guardlvl,5,Vector2(3600,-800),Vector2(2700,-1250),Vector2(1050,-370),Vector2(2250,80)]
var Guard4 = [guardlvl,5,Vector2(1050,-370),Vector2(2250,80),Vector2(3600,-800),Vector2(2700,-1250)]
var Camera1=[90,180,1]
var Camera2=[-180,-90,0]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cameraturnedoff=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
