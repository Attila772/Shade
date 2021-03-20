extends Node2D
var counter = 0
var dialogover = false
var dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	position -= Vector2(250,300)
	pass # Replace with function body.

func dialog(DialogString):
	dialog = DialogString
	get_tree().paused = true
	$Sprite.texture = load("res://Resources/" + DialogString[counter][0] + ".png")
	$Label.text = DialogString[counter][1]
			
		
	
func _physics_process(delta):
	if Input.is_action_just_released("interact") and counter < dialog.size()-1:
		counter +=1
		self.dialog(dialog)
	elif counter == dialog.size()-1:
		if Input.is_action_just_released("interact"): 
			counter = 0
			get_tree().paused = false
			get_parent().remove_child(self)
		
		
	
	
	
	
	
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dialogover:
		if Input.is_action_pressed("interact"):
			get_tree().paused = false
			get_parent().remove_child(self)
	pass
