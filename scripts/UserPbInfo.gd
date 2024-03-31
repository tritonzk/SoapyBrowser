extends ItemList

@onready var items = ItemList.new()
@onready var score_node = get_node("../ScoreBoard")

signal request_user_records

func _ready():
	pass

# check selected user from scoreboard
# call gtr api for trackdata (recent, highest pbs, wrs, most points)

func _on_score_board_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index == 1:
		print("index: ", index)
		print("at_position: ", at_position)
		print("mouse_button_index: ", mouse_button_index)
		var something = score_node.get_item_text(index)
		var file = FileAccess.open("items.json", FileAccess.READ)
		var data_from_items = JSON.new()
		data_from_items.parse(file.get_as_text())
		var scores = data_from_items.get_data()
		
		for x in scores["rankings"]:
			if x["position"] == index+1:
				print(x["user"])



func _on_tab_bar_tab_button_pressed(tab):
	pass # Replace with function body.
