extends Node
onready var time = 0
var savedlvl = 0
var backgroundmusicsetting =0
var soundeffectsetting = 0
var gadgets = []
var path =""
var SoundLevel=0
var isinmapselect = false

var LevelsDB = {
	"Tutorial": "res://Levels/TutorialLvl/TutorialLvl.tscn",
	"Test": "res://TestLevel/testLevel.tscn",
	"Hq":"res://Levels/HqLevel.tscn"
}


var AvailableLevels =  {
	"Tutorial": true,
	"Test" : true,
	"Debug":true
}

var LvlDescription= {
	"Tutorial": "Easy tutorial map to get to know \n the basics of the game",
	"Test": "Test level where we tried out the \n different functions and interactions",
	"Debug" : "Non existent level. "
}
