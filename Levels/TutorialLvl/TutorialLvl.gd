extends Node2D
var dialogbox = load("res://Ui Stuff/Dialogbox.tscn").instance()
var softdialog = load("res://Ui Stuff/SoftDialogBox.tscn").instance()


var dialog3 = ["scientist"," Press space to dash \n aaaa"]
var dialog4 = ["scientist"," You can use your gadget \n with  F  or by dashing"]
var dialog5 = ["scientist"," Try to reach the room to \n to the right, and get the key"]
var dialog7 = ["Scientist"," You found the access card! \n Now you can open the locked door"]

var Dialogs = [dialog3,dialog4,dialog5]

var Dialogs3 = [dialog7]

var dialogcheck = [false,false,false]

var guardlvl = 2
var checklocations=[Vector2(875,-175),Vector2(1450,130),Vector2(1170,-300),Vector2(2110,-175),Vector2(1365,-430),Vector2(2140,-205),Vector2(1650,-530),Vector2(2390,-300),Vector2(1910,-670),Vector2(2650,-450),Vector2(2170,-800),Vector2(3210,-230),Vector2(2530,-1020)]
var Guard = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard2 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard3 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard4 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Camera1 = [-180,-90,0]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.path= self.filename
#
	get_node("Camera2D").add_child(dialogbox)
	dialogbox.dialog(Dialogs)
#
	
	
#	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#
#	if !dialogcheck[1]:
#		if $Test/Player.position.distance_to(Vector2(1750,-180)) < 100:
#			get_node("Camera2D").add_child(dialogbox)
#			dialogbox.dialog(Dialogs2)
#			dialogcheck[1] = true

	if !dialogcheck[2]:
		if $Test/Key.visible == false:
			get_node("Camera2D").add_child(dialogbox)
			dialogbox.dialog(Dialogs3)
			dialogcheck[2] = true
#
#w
#
	
	
	pass
