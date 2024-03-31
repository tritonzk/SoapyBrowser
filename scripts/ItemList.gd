extends ItemList

@onready var file = "user://items.json"
@onready var itemlist = get_node(".")
	
func score_to_itemlist(score_dict):
	for x in score_dict["rankings"]:
		var item = str(x["position"]) + " : " + x["user"]["steamName"] + " (" + str(x["score"]) + ")"
		itemlist.add_item(item)

func _on_control_request_ready():
	var json_file = FileAccess.open(file, FileAccess.READ)
	var json_text = json_file.get_as_text() #string
	var json_obj = JSON.new() # JSON obj
	json_obj.parse(json_text) # parse json data
	var score_dict = json_obj.get_data() # score dict dictionary
	score_to_itemlist(score_dict)


func _on_tab_bar_tab_button_pressed(tab):
	pass # Replace with function body.
