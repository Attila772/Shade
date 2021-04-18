extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.isinmapselect = true
	get_tree().paused = true
	var list = Global.AvailableLevels
	for x in list.keys():
		if Global.AvailableLevels[x]:
			var mapselect = preload("res://Ui Stuff/Lvlselect.tscn").instance()
			var texture = load("res://Assets/"+x+".png")
			mapselect.get_node("Sprite").texture = texture
			mapselect.get_node("Label").text = x
			$ScrollContainer/HBoxContainer.add_child(mapselect)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		Global.isinmapselect = false
		get_tree().paused= false
		get_parent().remove_child(self)
	pass
