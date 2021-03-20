extends Line2D
var path = PoolVector2Array()
var player
var player_last_position=Vector2(0,0)
var guard
var Patrol_path
var turn_array
var got_turn_array
var index = 1
var timer = 4
enum {
	Patrol
	Chase
	Search
	Sus
}
var state = Patrol
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	path=get_parent().get_simple_path(guard.position,Patrol_path[index])
	self.points = path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		Patrol:
			guard.speed = 100
			timer = 2
			var dist = (guard.position-Patrol_path[index]).length()
			if dist< 5: 
				index+=1
				if index == Patrol_path.size():
					index = 0
			path=get_parent().get_simple_path(guard.position,Patrol_path[index])
			self.points = path
		Chase :
			guard.speed = 150
			player_last_position = player.global_position
			path=get_parent().get_simple_path(guard.position,player_last_position)
			self.points = path
		Search :
			if (guard.position-player_last_position).length()>100:
				path= get_parent().get_simple_path(guard.position,player_last_position)
				self.points = path
			else:
				guard.speed = 0
				timer-=delta
				if timer<0:
					timer = 4
					state = Sus
		Sus :
			if !got_turn_array:
				turn_array=path
				got_turn_array=true
			timer = timer - delta
			if timer > 3:
				path[1] = guard.position-((guard.position-turn_array[1]).rotated(deg2rad(-90*(4-timer))))
			if timer<3 && timer > 2:
				path[1] = guard.position-((guard.position-turn_array[1]).rotated(deg2rad(-90*(timer-2))))
			if timer<2 && timer > 1:
				path[1] = guard.position-((guard.position-turn_array[1]).rotated(deg2rad(90*(abs(timer-2)))))
			if timer < 1:
				path[1] = guard.position-((guard.position-turn_array[1]).rotated(deg2rad(90*(timer))))
			if timer < 0:
				state = Patrol
				got_turn_array=false
			self.points = path
				
