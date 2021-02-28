extends KinematicBody2D

var anim_direction="S"
var anim_mode= "Idle"
var animation
var speed = 200
var max_speed=200
var acceleration=600
var move_direction = "S"
var moving = false
var destination = Vector2()
var movement = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	$BackgroundTrack.play()


func _physics_process(delta):
	MovementLoop()
	move_and_slide(movement)
	pass
	
func MovementLoop():
	movement = Vector2(0,0)
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x -=1
		movement.y -=1
		move_direction="NW"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=-1
		move_direction="NE"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=1
		move_direction="SW"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=1
		move_direction="SE"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_up"):
		moving = true
		movement.x +=0
		movement.y +=-1
		move_direction="N"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_down"):
		moving = true
		movement.x +=0
		movement.y +=1
		move_direction="S"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_right"):
		moving = true
		movement.x +=1
		movement.y +=0
		move_direction="E"
		movement = movement.normalized() * speed
		return
	if Input.is_action_pressed("ui_left"):
		moving = true
		movement.x +=-1
		movement.y +=0
		move_direction="W"
		movement = movement.normalized() * speed
		return
	
	moving = false
	
func _process(delta):
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






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
