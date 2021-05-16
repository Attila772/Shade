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
	"Test": "res://TestLevel/testLevel.tscn",
	"Hq":"res://Levels/HqLevel.tscn",
	"Catacombs": "res://Levels/Catacombs/Catacomb.tscn",
	"Barni" : "res://Levels/BarniMap.tscn",
	"Museum": "res://Levels/Museum/Museum.tscn"
}


var AvailableLevels =  {
	"Tutorial": true,
	"Test" : true,
	"Catacombs": true,
	"Barni" : true,
	"Museum":true,
	"Debug":true
}

var LvlDescription= {
	"Tutorial": "Easy tutorial map to get to know \n the basics of the game",
	"Test": "Test level where we tried out the \n different functions and interactions",
	"Catacombs" : "Easy level with no enemies , \n jewel is hard to find",
	"Barni" : "generic map",
	"Museum": "museum",
	"Debug" : "Non existent level. "
}
