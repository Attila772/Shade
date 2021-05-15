extends Node2D
var dialogbox = load("res://Ui Stuff/Dialogbox.tscn").instance()
 
var oneshotaudio = false
var oneshotaudio2 = false
var oneshotaudio3 = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	Global.path= self.filename
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_node("Test/Player")
	if player.position.distance_to(Vector2(3709,-1175)) <50 :
		if get_node("Test/Wreckage").visible == false:
			get_node("Test/Wreckage").visible = true
			get_node("Test/Wreckage/CollisionPolygon2D").disabled = false
			get_node("Particles2D").visible = true
			$Rock1.play()
			$Rock2.play()
			
	if !$AmbientBase.playing and !$AmbientSpooky.playing and !$AmbientSpooky2.playing:
		$AmbientBase.play()
		
	if $Test/StaticBody2D4.visible  == false and !oneshotaudio:
		oneshotaudio = true
		$AmbientBase.stop()
		$AmbientSpooky.play()
		
	if $Test/Artifact.visible ==false and !oneshotaudio2:
		oneshotaudio2 = true
		$AmbientBase.stop()
		$AmbientSpooky2.play()
	if player.position.distance_to(Vector2(4436,331)) <50 and !oneshotaudio3:
		$AmbientBase.stop()
		$AmbientWhoosh.play()
		
	pass
