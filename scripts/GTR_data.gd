extends Control
class_name GTR_data

@onready var api_link = "https://api.zeepkist-gtr.com/"
@onready var api_playerpoints = "playerpoints?Limit=100&Offset=0"
@onready var api_users_id = "users/id/{id}"
@onready var api_users_rankings = "users/rankings?Limit=100&Offset=0"
@onready var item_file = "user://items.json"
@onready var control = Control.new()

signal request_ready

func _ready():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	var error = http_request.request(api_link + api_users_rankings)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _http_request_completed(result, response_code, headers, body):
	print("http signal")
	var json = JSON.new() # make new JSON object
	json.parse(body.get_string_from_utf8()) # parse text body after converting from utf8
	var response = json.get_data() # make JSON data var (dictionary)
	var text = JSON.stringify(response) # convert dict to string
	print(text)
	var file = FileAccess.open(item_file, FileAccess.WRITE) # open items.json with write access
	file.store_string(text) # store string data to file
	file.close() # close file
	
	emit_signal("request_ready")

func _on_user_pb_info_request_user_records():
	var http_request_userdata = HTTPRequest.new()
	#add_child(http_request_userdata)
	#http_request_userdata.request_completed.connect(self._http_request_userdata)
	var error = http_request_userdata.request(api_link + api_users_rankings)
	if error != OK:
		push_error("An error occurred in the HTTP request.")
		
#func _http_request_userdata():
	#pass
