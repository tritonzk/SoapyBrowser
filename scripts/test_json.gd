extends Node

@onready var butt = $"."

@onready var file = "user://zeeptest.json"

@onready var testDict = {"something":123124123412,
							"else":[1,2,334,5,65],
							"other":{
								"toehtehthehe":232345342534, 
								"324523":"asdflkjsdfoiwefn"}
}

func _ready():
	butt.pressed.connect(create_JSON)

func create_JSON():
	print("test")
	var json = JSON.new()
	var stringed = JSON.stringify(testDict, "\t")
	print(stringed)
	var file_open = FileAccess.open(file, FileAccess.WRITE)
	file_open.store_string(stringed)
	file_open.close()


	
