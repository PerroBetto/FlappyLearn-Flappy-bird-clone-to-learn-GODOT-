extends Node

class_name Save_Settings

var save_path : String = "user://savefile.save"
var settings_path : String = "user://flappy.settings"

var High_Score : int
var Paused : bool = false


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
func save_settings(values : Array): 

	# Use JSON to store the settings data as key-value pairs(?)
	# Ensure you open and close the file, that everything workds and it all makes sense
	# Game should open the settings file from the get-go and update the values in settings accordingly

	var settingsFile = FileAccess.open(settings_path, FileAccess.WRITE)

	settingsFile.store_line("dog")

	settingsFile.close()

func get_settings() -> Array:
	var array = [1,2,3]
	return array

func load_settings():
	pass
