extends Node

class_name Save_Settings

var save_path : String = "user://savefile.save"
var settings_path : String = "user://flappy.settings"

var High_Score : int
var Paused : bool = false

# var WinMode : Window.Mode;
# var Resolution : Vector2i;
# var Volume : float;
var base_settings = {
	"Window_Mode" : Window.Mode.MODE_WINDOWED,
	"Resolution_x" : 1280,
	"Resolution_y" : 720,
	"Volume" : 100.0

}

#
# Save file IO data
#
func _load_data():
	if !(FileAccess.file_exists(save_path)):
		return
	
	var saveFile = FileAccess.open(save_path, FileAccess.READ)
	var json = JSON.new()
	
	var parseResult = json.parse(saveFile.get_line())
	if(parseResult != OK):
		return
	
	High_Score = json.data
	
	saveFile.close()
	

func _save_score(score : int):
	var saveFile = FileAccess.open(save_path, FileAccess.WRITE)
	
	var json_score = JSON.stringify(score)
	
	saveFile.store_line(json_score)
	
	saveFile.close()
	

#
# Settings file IO data
#
func save_settings(values : Dictionary): 

	# Use JSON to store the settings data as key-value pairs(?)
	# Ensure you open and close the file, that everything workds and it all makes sense
	# Game should open the settings file from the get-go and update the values in settings accordingly

	# for key in values:
	# 	print("key: " + str(key) + ": " + str(values[key]))

	var settingsFile = FileAccess.open(settings_path, FileAccess.WRITE)

	var json_string = JSON.stringify(values)

	settingsFile.store_line(json_string)

	settingsFile.close()

func get_settings() -> Dictionary:
	if!(FileAccess.file_exists(settings_path)):
		return {}
	
	var settingsFile = FileAccess.open(settings_path, FileAccess.READ)

	#helper variable
	var json = JSON.new()

	var err = json.parse(settingsFile.get_line())
	if!(err == OK):
		print("didnt work")
		return {}

	var file_data = json.data

	settingsFile.close()
	return file_data

func load_settings():
	if!(FileAccess.file_exists(settings_path)):
		save_settings(base_settings)
	
	var file_data = get_settings()

	#Keys: 
	#Window_Mode: Window.mode
	#Resolution: screen resolution
	#Volume: float

	get_tree().get_root().get_window().mode = file_data["Window_Mode"]
	DisplayServer.window_set_size(Vector2i(file_data["Resolution_x"], file_data["Resolution_y"]))

	var new_volume = 20 * (log(file_data["Volume"])/log(10)) -  40
	AudioServer.set_bus_volume_db(0, new_volume)
	print(new_volume)


	
