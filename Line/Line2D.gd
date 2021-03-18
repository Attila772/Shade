extends Line2D
var path = PoolVector2Array()
var player
var player_last_position=Vector2(0,0)
var guard
var Patrol_path
var index = 1
var timer = 2
enum {
	Patrol
	Chase
	Search
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
			timer = 2
			var dist = (guard.position-Patrol_path[index]).length()
			if dist< 5: 
				index+=1
				if index == Patrol_path.size():
					index = 0
			path=get_parent().get_simple_path(guard.position,Patrol_path[index])
			self.points = path
		Chase :
			guard.speed = 125
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
					guard.speed = 125
					state = Patrol
