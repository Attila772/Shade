extends Node
onready var time = 0
var savedlvl = 0
var backgroundmusicsetting =0
var soundeffectsetting = 0
var gadgets = []
var path =""
var SoundLevel=0
var isinmapselect = false
var Gadget = "n"

var LevelsDB = {
	"Tutorial": "res://Levels/TutorialLvl/TutorialLvl.tscn",
	"Hq":"res://Levels/HqLevel.tscn",
	"Catacombs": "res://Levels/Catacombs/Catacomb.tscn",
	"Barni" : "res://Levels/BarniMap.tscn",
	"Museum": "res://Levels/Museum/Museum.tscn"
}


var AvailableLevels =  {
	"Tutorial": true,
	"Catacombs": true,
	"Barni" : true,
	"Museum":true,
	"Debug":true
}

var LvlDescription= {
	"Tutorial": "Easy tutorial map to get to know \n the basics of the game",
	"Catacombs" : "Easy level with no enemies , \n jewel is hard to find",
	"Barni" : "Medium hard map, ",
	"Museum": "Fairly hard map, not recommended for \n first try",
	"Debug" : "Non existent level. "
}
