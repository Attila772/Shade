extends KinematicBody2D

var movement = Vector2(1,1)
var speed = 200
var animation
var anim_mode="Walk"
var angle
var move_direction = "N"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func movementloop():
	movement = $'../Player'.position-self.position
	movement=movement.normalized()*speed
	angle = rad2deg(Vector2(0,-1).angle_to(movement))
	if (angle>-22.5 && angle<22.5):
		move_direction="N"
	if (angle>22.5 && angle<67.5):
		move_direction="NE"
	if (angle>67.5 && angle<112.5):
		move_direction="E"
	if (angle>112.5 && angle<157.5):
		move_direction="SE"
	if (angle>157.5 && angle<-157.5):
		move_direction="S"
	if (angle>-157.5 && angle<-112.5):
		move_direction="SW"
	if (angle>112.5 && angle<-67.5):
		move_direction="W"
	if (angle>-67.5 && angle<-22.5):
		move_direction="NW"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movementloop()
	move_and_slide(movement)
	Animationloop()
	
func _process(delta):
	Animationloop()
	
func Animationloop():
	animation = "Walk_" + move_direction
	print(animation)
	$GuardAnimationPlayer.play(animation)
	pass
