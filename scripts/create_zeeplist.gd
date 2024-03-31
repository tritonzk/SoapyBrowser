extends Node

@onready var zeeplist_format = {"name" : "",
	"amountOfLevels" : 0,
	"roundLength" : 0,
	"shufflePlaylist" : false,
	"levels": []}

@onready var track_format = {"UID": "",
		"WorkshopID": 0,
		"Name": "",
		"Author": ""}

@onready var zeepDict = {}

func _ready():
	pass
	
func zeepfile_Constructor(UIDDict, filename, roundlength, shuffle):
	for x in UIDDict.items():
		var zeepDict = zeeplistFormat
		trackFormat = {"UID" : str(x[0]), 
						   "WorkshopID" : int(x[1][2]), 
						   "Name" : str(x[1][0]), 
						   "Author" : str(x[1][1])}
		var levelList = zeepDict["levels"]
		levelList.append(trackFormat)
		zeepDict["levels"] = levelList
		zeepDict["name"] = filename

	zeepDict["amountOfLevels"] = len(UIDDict)
	zeepDict["roundLength"] = roundlength
	zeepDict["shufflePlaylist"] = shuffle
	
	os.chdir(workDirectory)
	playlistFile = open(filename + ".zeeplist", "w")
	var json = JSON.new()
	json.stringify(zeepDict, "/t")
	json.dump(self.zeepDict, playlistFile, indent =  2)
	playlistFile.close()
