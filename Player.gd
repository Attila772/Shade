extends KinematicBody2D

var Line_location = preload("res://Line/Line2D.tscn")
var Line_name
var anim_direction="S"
var debug_mode = false
var anim_mode= "Idle"
var animation
var speed = 150
var max_speed=200
var acceleration=600
var move_direction = "S"
var moving = false
var destination = Vector2()
var movement = Vector2()
var HasTreasure = false
var Gadget = ""
var timer =1
var dashcooldown = 0
const DASHCOOLDOWN = 2
var dashtimer = 0.5
var dashrot =0
var haskey = false
var MouseNav = false
var Line
var Dashing = false
var angle
var speedtimer = 5
var gadgetmultiplier = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	Line = Line_location.instance()
	Line.guard= self
	Line.name = "Line_of_"+str(self.name)
	Line_name = "Line_of_"+str(self.name)
	set_destination(self.position)
	get_parent().get_parent().get_node("Navigation2D").add_child(Line)
	if Global.Gadget != "none":
		Gadget = Global.Gadget
		gadgetpickedup()
	
#	var uinode =$Camera2D/MarginContainer/Sprite
#	var label = $DaschcooldownNum
#	remove_child($Camera2D/MarginContainer/Sprite)
#	remove_child($DaschcooldownNum)
#	get_parent().get_parent().add_child(uinode)
#	get_parent().get_parent().add_child(label)
#
#	var temp = get_parent().get_parent().get_node("label")
#	print(temp.get_path())
#	print("YEET")
	Global.time = 0

func _physics_process(delta):
	if MouseNav:
		if Input.is_action_pressed("MouseNav"):
			destination = get_global_mouse_position()
			set_destination(destination)
	if dashtimer >= 0:
		dashtimer -=delta
	
	if dashcooldown>0:
		dashcooldown -=delta
		
	if dashtimer <0:
		if !debug_mode:
			$Particles2D2.visible = false
			$Sprite.visible = true
			$CollisionShape2D.disabled = false
			Dashing = false
			speed = 150
		
	if Input.is_action_just_released("IngameMenu") and !Global.isinmapselect:
		var menu = load("res://Ui Stuff/PauseMenu.tscn").instance()
		menu.position = position
		menu.position.y-=250
		menu.position.x -=250
		get_parent().get_parent().add_child(menu)
	particles(delta)
	if !MouseNav:
		MovementLoop()
	else:
		mousemovement()
	move_and_slide(movement)
	get_parent().get_parent().get_node("Camera2D").position = position
	AnimationLoop()
	pass
	
func MovementLoop():
	$Particles2D2.rotation_degrees = dashrot
	movement = Vector2(0,0)
	if Input.is_action_pressed("dash"):
		if dashcooldown <=0:
			dashcooldown = DASHCOOLDOWN
			if Gadget == "RingOfY":
				$Sprite.visible = false
				$Particles2D2.visible = true
				$CollisionShape2D.disabled = true
				#dashcooldown += 20
				speed *=2
			speed *=5
			Dashing = true
			dashtimer =0.3
			
			
			
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x -=1
		movement.y -=0.5
		move_direction="NW"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = -45
		return
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=-0.5
		move_direction="NE"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = 45
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=0.5
		move_direction="SW"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = 225
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=0.5
		move_direction="SE"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = -225
		return
	if Input.is_action_pressed("ui_up"):
		moving = true
		movement.x +=0
		movement.y +=-1
		move_direction="N"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = 0
		return
	if Input.is_action_pressed("ui_down"):
		moving = true
		movement.x +=0
		movement.y +=1
		move_direction="S"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = 180
		return
	if Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=0
		move_direction="E"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = 90
		return
	if Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=0
		move_direction="W"
		movement = movement.normalized() * speed *gadgetmultiplier
		dashrot = -90
		return
	
	moving = false
	
	
	
	
func mousemovement():
	anim_mode = "Walk"
			
	movement = $'../../Navigation2D'.get_node(Line_name).points[1]-self.position
	var angle = rad2deg(Vector2(0,-1).angle_to(movement))
	$Particles2D2.rotation_degrees = dashrot
	
	if Input.is_action_pressed("dash"):
		if dashcooldown <=0:
			dashcooldown = DASHCOOLDOWN
			if Gadget == "RingOfY":
				$Sprite.visible = false
				$Particles2D2.visible = true
				$CollisionShape2D.disabled = true
				#dashcooldown += 20
				speed *=2
			speed *=5
			dashtimer =0.3
			Dashing = true
			
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
	movement=movement.normalized()*speed
	
func set_destination(destination):#Sets destination for Line for pathfinding
	Line.destination = destination

func _process(delta):
	
	get_parent().get_parent().get_node("Camera2D").get_node("label").text = str(stepify(dashcooldown,0.1))
	if dashcooldown <=0:
		get_parent().get_parent().get_node("Camera2D").get_node("uinode").modulate = Color(0,255,0)
	else:
		get_parent().get_parent().get_node("Camera2D").get_node("uinode").modulate  = Color(205,0,0)
	
	
	if self.position.distance_to(destination)<50:
		set_destination(self.position)
	
	Global.time += delta
	if movement ==Vector2(0,0):
		$AnimationPlayer.stop()
	if moving == true:
		if !$walksound.playing:
			$walksound.play()
		anim_mode="Walk"
	else:
		$walksound.stop()
		anim_mode="Idle"
	
	
func AnimationLoop():
	if speed == 0:
		anim_mode ="Idle"
	var temp = anim_mode
	if Dashing:
		temp="Dash"
	animation = temp + "_" + move_direction
	$AnimationPlayer.playback_speed = gadgetmultiplier
	$AnimationPlayer.play(animation)


func gadgetpickedup():
	var path = "res://Assets/gadgets/" + Gadget + ".png"
	get_parent().get_parent().get_node("Camera2D").get_node("MarginContainer").get_node("Sprite").texture = load(path)
	get_parent().get_parent().get_node("Camera2D").get_node("MarginContainer").get_node("Sprite").scale = Vector2(0.3,0.3)

func particles(delta): # Press F to pay respect
	if Input.is_action_just_released("Gadget"):
		if Gadget =="RangeFinder":
			if $Dist.visible == false:
				$Dist.visible = true
			else:
				 $Dist.visible = false
				
		if Gadget =="Emp":
			$Particles2D.visible = true
			Global.cameraturnedoff = true
			timer = 1
		if Gadget =="RingOfSpeed" and speedtimer ==5 and gadgetmultiplier ==1:
			gadgetmultiplier = 3
	
	if Gadget == "RingOfSpeed" and speedtimer <0:
		gadgetmultiplier =1
		speedtimer =5
	if speedtimer >0 and gadgetmultiplier >1:
		speedtimer -=delta
#	print(timer)
	if $Particles2D.visible == true:
		if !$Emp.playing:
			$Emp.play()
		timer -= delta
	if timer < 0:
		timer =1
		$Particles2D.visible =false

# Called every frame. 'delta' is the elapsed time since the previous frame.

