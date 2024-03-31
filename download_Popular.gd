extends Button

@onready var button = $"."

func _ready():
	button.pressed.connect(self._buttonpressed)

func _buttonpressed():
	print("test")
