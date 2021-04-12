extends Node2D
var counter = 0
var dialogover = false
var dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = 0
var dialog_started = false
# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	position -= Vector2(250,300)
	pass # Replace with function body.

func dialog(DialogString):
	dialog = DialogString
	$Sprite.texture = load("res://Resources/" + DialogString[counter][0] + ".png")
	$Label.text = DialogString[counter][2]
	timer = int(DialogString[counter][1])	
	dialog_started = true
	
		
		
	
func _physics_process(delta):
	#print("timer: ", timer, "  counter: ", counter)
	#position = get_parent().get_parent().get_node("Test").get_node("Canera2D").position
	if !timer<=0:
		timer-= delta
	elif dialog_started:
		counter+=1
		if len(dialog) <= counter:
			counter = 0
			get_parent().remove_child(self)
		
		else:
			self.dialog(dialog)
		
	
	
	
	
	
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
