extends Navigation2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	for node in get_tree().get_nodes_in_group("colliders"):
#		SubtractCollider(node)
#	get_node("NavigationPolygonInstance").enabled = false
#	get_node("NavigationPolygonInstance").enabled = true
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#func SubtractCollider (node):
#	var newpolygon = PoolVector2Array()
#	var polygon = NavigationPolygon.new() 
#	var expolygon = $NavigationPolygonInstance.get_navigation_polygon()
#	var polygon_transform = node.get_node("CollisionPolygon2D").get_global_transform()
#	var polygon_bp = node.get_node("CollisionPolygon2D").get_polygon()
#	for vertex in polygon_bp:
#		newpolygon.append(polygon_transform.xform(vertex))
#	for i in range(expolygon.get_outline_count()):
#		polygon.add_outline(expolygon.get_outline(i))
#	polygon.add_outline(newpolygon)
#	polygon.make_polygons_from_outlines()
#	$NavigationPolygonInstance.navpoly = polygon
