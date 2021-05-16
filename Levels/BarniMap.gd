extends Node2D

var guardlvl=2
var checklocations=[Vector2(-168,1267),Vector2(373,1004),Vector2(890,754),Vector2(1306,983),Vector2(1912,1292),Vector2(2488,1157),Vector2(1276,567),Vector2(882,1907),Vector2(-537,661)]
var Guard1=[guardlvl,2,Vector2(1283,157),Vector2(3147,1145),Vector2(2693,1508),Vector2(2500,1164),Vector2(1333,598),Vector2(2500,1164),Vector2(2693,1508),Vector2(3147,1145)]
var Guard2=[guardlvl,5,Vector2(201,713),Vector2(-1074,1349),Vector2(900,2416),Vector2(1663,2022),Vector2(900,2416),Vector2(-1074,1349)]
var Guard3=[guardlvl,0,Vector2(1481,1654),Vector2(298,1599),Vector2(790,1234)]
var Camera1=[-180,-90,0]
var Camera2=[90,180,1]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
