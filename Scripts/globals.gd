extends Node

var save_path : String = "user://savefile.save"

var High_Score : int

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
	
