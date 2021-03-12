extends KinematicBody2D

var anim_direction="S"
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
var dashtimer = 0.5
var dashrot =0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	
	Global.time = 0
	$BackgroundTrack.play()


func _physics_process(delta):
	
	if dashtimer >= 0:
		dashtimer -=delta
	
	if dashcooldown>0:
		dashcooldown -=delta
		
	if dashtimer <0:
		$Particles2D2.visible = false
		$Sprite.visible = true
		speed = 150
		
	if Input.is_action_just_released("IngameMenu"):
		var menu = load("res://Ui Stuff/PauseMenu.tscn").instance()
		menu.position = position
		menu.position.y-=250
		menu.position.x -=250
		get_parent().get_parent().add_child(menu)
	particles(delta)
	MovementLoop()
	move_and_slide(movement)
	pass
	
func MovementLoop():
	$Particles2D2.rotation_degrees = dashrot
	movement = Vector2(0,0)
	if Input.is_action_pressed("dash"):
		if dashcooldown <=0:
			$Sprite.visible = false
			dashtimer =0.3
			dashcooldown = 1
			
			$Particles2D2.visible = true
			speed *=5
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x -=1
		movement.y -=0.5
		move_direction="NW"
		movement = movement.normalized() * speed
		dashrot = -45
		return
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=-0.5
		move_direction="NE"
		movement = movement.normalized() * speed
		dashrot = 45
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=0.5
		move_direction="SW"
		movement = movement.normalized() * speed
		dashrot = 225
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=0.5
		move_direction="SE"
		movement = movement.normalized() * speed
		dashrot = -225
		return
	if Input.is_action_pressed("ui_up"):
		moving = true
		movement.x +=0
		movement.y +=-1
		move_direction="N"
		movement = movement.normalized() * speed
		dashrot = 0
		return
	if Input.is_action_pressed("ui_down"):
		moving = true
		movement.x +=0
		movement.y +=1
		move_direction="S"
		movement = movement.normalized() * speed
		dashrot = 180
		return
	if Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=0
		move_direction="E"
		movement = movement.normalized() * speed
		dashrot = 90
		return
	if Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=0
		move_direction="W"
		movement = movement.normalized() * speed
		dashrot = -90
		return
	
	moving = false
	
func _process(delta):
	Global.time += delta
	if movement ==Vector2(0,0):
		$AnimationPlayer.stop()
	if !$BackgroundTrack.playing:
		$BackgroundTrack.play()
	if moving == true:
		if !$walksound.playing:
			$walksound.play()
		anim_mode="Walk"
	else:
		$walksound.stop()
		anim_mode="Idle"
	AnimationLoop()
	
func AnimationLoop():
	animation = anim_mode + "_" + move_direction
	$AnimationPlayer.play(animation)


func gadgetpickedup():
	var path = "res://Assets/gadgets/" + Gadget + ".png"
	$Camera2D/MarginContainer/Sprite.texture = load(path)
	$Camera2D/MarginContainer/Sprite.scale = Vector2(0.3,0.3)

func particles(delta): # Press F to pay respect
	if Input.is_action_just_released("Gadget"):
		if Gadget =="RangeFinder":
			if $Dist.visible == false:
				$Dist.visible = true
			else:
				 $Dist.visible = false
				
		if Gadget =="Emp":
			$Particles2D.visible = true
			timer = 1
#	print(timer)
	if $Particles2D.visible == true:
		if !$Emp.playing:
			$Emp.play()
		timer -= delta
	if timer < 0:
		timer =1
		$Particles2D.visible =false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
