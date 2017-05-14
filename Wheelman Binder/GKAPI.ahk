/*
	project: GKAPI
	description: AutoHotkey Include
	version: 3.0
	author: James_Hilton (http://rpg-city.de/index.php/User/294)
*/

global GKAPI_COLOR_ERROR		:= "{FF0000}"
global GKAPI_PREFIX_ERROR		:= GKAPI_COLOR_ERROR . "[Fehler] "
global GKAPI_COLOR_NORMAL		:= "{0077FF}"
global GKAPI_PREFIX_NORMAL		:= GKAPI_COLOR_NORMAL . "[GK] "
global GKAPI_COLOR_LIST			:= "{0077FF}"
global GKAPI_PREFIX_LIST		:= GKAPI_COLOR_LIST . "[GK] "

class GKAPI {
	gk := ""
	gks := []
	
	__New() {
		
	}
	
	query(gk) {		
		if(!RegExMatch(gk, "^\s*(\d+)\.(\d+)\s*$", regex_)) {
			return new this.Result(this.Result.ERROR_FORMATGK)
		}
		
		path := A_Temp . "\ahk_gkapi"
		url := "http://samp.lennartf.com/gk/api/" . regex_1 . "/" . regex_2
		UrlDownloadToFile, %url%, %path%
		if(ErrorLevel) {
			return new this.Result(this.Result.ERROR_SERVER)
		}
		
		FileRead, file, %path%
		if(ErrorLevel) {
			return new this.Result(this.Result.ERROR_FILESYSTEM)
		}
		
		Loop, Parse, file, `n
		{
			if(A_Index == 1) {
				if(A_LoopField != "success") {
					return new this.Result(this.Result.ERROR_INVALID)
				}
				else {
					this.gk := regex_1 . "." . regex_2
					this.gks := []
				}
			}
			else if(RegExMatch(A_LoopField, "^([^`t]*)`t([^`t]*)`t([^`t]*)`t([^`t]*)`t([^`t]*)", regex_)) {
				this.gks.Insert({type: regex_1, name: regex_2, x: regex_3 + 0, y: regex_4 + 0, z: regex_5 + 0, position: (StrLen(regex_3) && StrLen(regex_4) && StrLen(regex_5))})
			}
		}
		
		return new this.Result()
	}
	
	printList() {		
		if(!this.gk) {
			return new this.Result(this.Result.ERROR_NOQUERY)
		}
		
		if(!this.gks.Length()) {
			addChatMessage(GKAPI_PREFIX_NORMAL . "{FFFFFF}Es konnte kein passender Gebäudekomplex unter " . GKAPI_COLOR_NORMAL . this.gk . "{FFFFFF} gefunden werden.")
		}
		else {
			addChatMessage(GKAPI_PREFIX_NORMAL . "{FFFFFF}Es wurden folgende Gebäudekomplexe unter " . GKAPI_COLOR_NORMAL . this.gk . "{FFFFFF} gefunden:")
			
			For index, object in this.gks
			{
				if(object.type == "generic")
					color := "{FF7F00}"
				else if(object.type == "house")
					color := "{77FF00}"
				else if(object.type == "vehicle")
					color := "{DD11FF}"
				else
					color := "{FFFFFF}"
				
				addChatMessage(GKAPI_PREFIX_LIST . "{FFFFFF}" . index ". " . color . object.name . (this.gks[index].position ? ("{FFFFFF} in " . color . calculateZone(this.gks[index].x, this.gks[index].y, this.gks[index].z) . ", " . calculateCity(this.gks[index].x, this.gks[index].y, this.gks[index].z)) : ""))
			}
		}
		
		return new this.Result()
	}
	
	sendToMap(id, map, message) {
		if(!RegExMatch(id, "^\s*(\d+)\s*$", regex_)) {
			return new this.Result(this.Result.ERROR_FORMATNUMBER)
		}
		
		if(!this.gk) {
			return new this.Result(this.Result.ERROR_NOQUERY)
		}
		
		if(regex_1 < 1 || regex_1 > this.gks.Length()) {
			return new this.Result(this.Result.ERROR_NONUMBER)
		}
		
		if(!this.gks[regex_1].position) {
			return new this.Result(this.Result.ERROR_NOPOSITION)
		}
		
		return map.update(this.gk . " " . this.gks[regex_1].name, this.gks[regex_1].x, this.gks[regex_1].y, this.gks[regex_1].z, message)
	}
	
	class Result {
		static ERROR_SERVER				:= 101
		static ERROR_INVALID			:= 102
		static ERROR_FILESYSTEM			:= 103
		static ERROR_FORMATGK			:= 104
		static ERROR_FORMATNUMBER		:= 105
		static ERROR_NOQUERY			:= 106
		static ERROR_NONUMBER			:= 107
		static ERROR_NOPOSITION			:= 108
		
		success := false
		error := false
		
		__New(error = false) {
			if(!error) {
				this.success := true
			}
			else {
				this.error := error
			}
		}
		
		printError() {
			if(!this.success) {
				if(this.error == this.ERROR_SERVER)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Der Server ist zurzeit nicht erreichbar. Versuche es (später) nochmal!")
				else if(this.error == this.ERROR_INVALID)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Die vom Server erhaltenden Daten sind ungültig. Versuche es (später) nochmal!")
				else if(this.error == this.ERROR_FILESYSTEM)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Auf die vom Server erhaltenden Daten kann nicht zugegriffen werden. Wurde der Keybinder als Administrator gestartet?")
				else if(this.error == this.ERROR_FORMATGK)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Der Gebäudekomplex wurde falsch formatiert. Hier muss der Gebäudekomplexe-Code eingegeben werden.")
				else if(this.error == this.ERROR_FORMATNUMBER)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Die Nummer wurde falsch formatiert. Hier muss die Nummer die bei der Gebäudekomplex-Abfrage vor dem Gebäudekomplex steht eingegeben werden.")
				else if(this.error == this.ERROR_NOQUERY)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Es wurden noch keine Gebäudekomplexe abgefragt. Nutze zuerst den Befehl Gebäudekomplex-Abfrage Befehl des Keybinders.")
				else if(this.error == this.ERROR_NONUMBER)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "In der letzten Gebäudekomplex-Abfrage konnte kein Gebäudekomplex mit dieser Nummer gefunden werden.")
				else if(this.error == this.ERROR_NOPOSITION)
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Mit diesem Gebäudekomplex ist keine Position verbunden.")
				else
					addChatMessage(GKAPI_PREFIX_ERROR . "{FFFFFF}" . "Ein unbekannter Fehler ist aufgetreten. Versuche es (später) nochmal!")
			}
			
			return this.success
		}
	}
}
