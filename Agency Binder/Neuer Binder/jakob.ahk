#ifWinActive, GTA:SA:MP
#SingleInstance, force
#Persistent
#UseHook
#NoEnv
#Include API.ahk


;~ AddFarbe := {0E1681}Agency{FFFFFF} | TEXT LALAL 

SetTimer, antiSpam, On
SetTimer, Xtaste, 500
Settimer, hacken, 150
Settimer, hacken, 150
SetTimer, Grabben, On
SetTimer, fee, 1000

IfNotExist, %A_AppData%\Agency-Keybinder\
{
	FileCreateDir, %A_AppData%\Agency-Keybinder\
	MsgBox, 48, Agency Keybinder, Der Keybinder erstellt nun dein Ordner, 5
	Sleep 2000
	Reload
}
ifExist, updater.exe
{
FileDelete, updater.exe
}

keybinderVersion := 0.1
global username := GetUsername()

if(username == "")
{
RegRead, username, HKCU, Software\SAMP, PlayerName
}
url = http://wheelman.jameschans.de/keybinder/check.php?name=%username%
UrlDownloadtoVar(url, result)
result = 1
if(result == 0 || result == -1 || result == -2)
{
	MsgBox, 16, Fehler, Du stehst nicht auf der Whitelist`, bitte kontaktiere die Leaderschaft, 4
	ExitApp
} else {
	VarSetCapacity(url, -1)
	VarSetCapacity(result, -1)
}


urli = http://wheelman.jameschans.de/keybinder/version.txt
URLDownloadToVar(urli, result_)
if(result_ > keybinderVersion)
{
        MsgBox, 68, Update verfügbar, Lieber Benutzer,`nes ist ein neues Update für den Keybinder verfügbar ( Version %result_% ).`nMöchtest Du nun updaten?
        IfMsgBox, Yes
        {
                MsgBox, 68, Update wird heruntergeladen!, Das Update wird nun heruntergeladen, 3
                URLDownloadToFile, http://wheelman.jameschans.de/keybinder/updater.exe, updater.exe
                MsgBox, 68, Updater start, Der Updater wird nun gestartet und der Keybinder geschlossen., 3
                run, updater.exe
                ExitApp
        }
	}
/*
Hotkey1  -  Motor
Hotkey2  -  Lock
Hotkey3  -  Members
Hotkey4  -  Fische Essen
Hotkey5  -  Use Drugs
Hotkey6  -  Erstehilfe
Hotkey7  -  BK rufen
Hotkey8  -  BK beenden
Hotkey9  -  BK helfen
Hotkey10  - Eject All
Hotkey11  - Position im F
Hotkey12  - Letzer Befehl
Hotkey13  - Afind Stoppen
Hotkey14  - Hacken
Hotkey15  - Accept Wheelman
Hotkey16  - Auftrag zurücklegen
Hotkey17  - Auftrag abbrechen
Hotkey18  - Ausruesten Prof 1
Hotkey19  - Ausruesten Prof 2
Hotkey20  - Contracts
Hotkey21  - Mask
Hotkey22  - Tor Auf
Hotkey23  - Keybinder Pausieren
Hotkey24  - XTaste Selbst belegbar
Hotkey25  - Selbst Belegbar
Hotkey26  - Selbst Belegbar
Hotkey27  - Selbst Belegbar
Hotkey28  - Selbst Belegbar
Hotkey29  - Selbst Belegbar
Hotkey30  - Selbst Belegbar
Hotkey31  - Selbst Belegbar
Hotkey32  - Selbst Belegbar
Hotkey33  - Selbst Belegbar
Hotkey34  - Selbst Belegbar
Hotkey35  - Selbst Belegbar
e & 1|2|3 - Eject Platz
/fg       - /festgeld "fg"
/gk       - GK Suche
/tr       - Taschenrechner
/p        - Anruf Annehmen
/h        - Anruf Beenden
/ksms     - sms bei Name
/resms    - Re SMS
/ftime    - Time in Fraktion
/cd       - Countdown
/alotto   - Random Lotto
/aall     - Ausrüsten All
/link     - Link grabben
/ac       - Accept alles mögliche
/af       - Afind
/as       - AShow
/cops     - Cop liste
/addcop   - Add Cop
/dellcop  - Dell Cop
/relog    - Relog
*/






;Motor
HotKey1: 
if(IsInChat())
	return
if(IsPlayerInAnyVehicle() == "0")
{
	AddChatMessage("Du bist in keinem Fahrzeug")
}
else
{
    If(IsPlayerDriver() == 0)
    {
		AddChatMessage("Du bist nicht der Fahrer eines Fahrzeuges.")
	}
    else
    {
		SendChat("/motor")
        Sleep, 10
        
		if(getVehicleLightState() == 0 && ALight == 1)
			SendChat("/licht")
		if(Alock == 1 && getVehicleLockState() == 0)
			SendChat("/lock")
			
	}			
}
return

;lock
HotKey2:
if(IsInChat())
	return
if(IsPlayerInAnyVehicle() == "0")
{
        AddChatMessage("Du befindest dich in keinem Fahrzeug.")
}
else
{
        SendChat("/lock")
}
return

;members
HotKey3:
if(IsInChat())
	return
SendChat("/members")
return



;Fische essen
HotKey4:
Iniread, Fische, %A_AppData%\Agency-Keybinder\settings.ini, HP, Fische
Iniread, FishUse, %A_AppData%\Agency-Keybinder\settings.ini, HP, FishUse
if(IsInChat())
	return

if(Fische == 1)
{
	if(getPlayerHealth() > FishUse)
	{
		AddChatMessage( "Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . FishUse . " HP{FFFFFF} Fische essen.")
	}
	else
	{
	SendChat("/eat " . fischers . "")
	fischers++
	}
}
else
{
	SendChat("/eat " . fischers . "")
	fischers++
}
if(fischers == "6")
{
	fischers=1
	sleep, 500
	AddChatMessage("Du hast alle Fische Verbraucht.")
}

return

;usedrugs
HotKey5:
Iniread, Drugs, %A_AppData%\Agency-Keybinder\settings.ini, HP, Drugs
Iniread, DrugsUse, %A_AppData%\Agency-Keybinder\settings.ini, HP, DrugsUse
if(IsInChat())
	return
if(Drugs == 1)
{
		if(getPlayerHealth() > DrugsUse) 
		{
			AddChatMessage(" Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . DrugsUse . " HP{FFFFFF} deine Drogen benutzen.")
			return
		}      
		else
		{
			SendChat("/usedrugs")
		}
}
else
{
	SendChat("/usedrugs")
}
return

;Erstehilfe
HotKey6:
Iniread, Erstehilfe, %A_AppData%\Agency-Keybinder\settings.ini, HP, Erstehilfe
Iniread, PaketUse, %A_AppData%\Agency-Keybinder\settings.ini, HP, PaketUse
if(IsInChat())
	return
if(Erstehilfe == 1)
{
	if(GetPlayerHealth() > PaketUse) 
		{
			AddChatMessage(" Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . PaketUse . " HP{FFFFFF} dein Erstehilfe Paket benutzen.")
			return
		}
	else
	{
		SendChat("/erstehilfe")
	}
}
else
{
	SendChat("/erstehilfe")
}
return

;BK
HotKey7:
zone := getPlayerZone() 
City := getPlayerCity()
if(!IsInChat())
{
	SendChat("/F BK! POS: " zone ", " City " | ID: " . getId() . " | HP: " . GetPlayerHealth() . "") 
}
return

;Bkend
HotKey8:
if(IsInChat())
	return
SendChat("/f BK wird NICHT mehr benötigt!")
return

;BKHelp
HotKey9:
if(IsInChat())
	return
SendChat("/F Ich bin Unterwegs | Pos: " city ", " zone " ")
return

;Eject all
HotKey10:
psg := GetSeatIDs()
if(isInChat())
	return
if(psg[2] != -1)
{	
SendChat("/eject "psg[2])
}
if(psg[3] != -1)
{
SendChat("/eject "psg[3])
}
if(psg[4] != -1)
{
SendChat("/eject "psg[4])
}
return


;PosF
HotKey11:
if(IsInChat())
	return
 SendChat("/F Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return


;Letzter Befehl
HotKey12:
if(IsInChat())
	return
SendInput t{up}{enter}
return


;Afind Stoppen
HotKey13:
if(IsInChat())
	return
SetTimer, Find, Off
SetTimer, Show, Off
SetTimer, GK, Off
AddChatMessage( "Automatisches Findsystem deaktiviert.") 
return



;Hacken
HotKey14:
if(IsInChat())
	return
SendChat("/hacken")
return


;Accept Wheelman
HotKey15:
if(IsInChat())
	return
SendChat("/accept Wheelman")
Settimer, accept, 500
return

accept:
username := GetUsername()
GetChatLine(0, line1)
if(InStr(line1, "Du hast den Auftrag von") && InStr(line1, "angenommen"))
{
	Settimer, accept, off
	url = http://wheelman.jameschans.de/keybinder/angen.php?name=%username%
	UrlDownloadToVar(url, result)
	StringSplit, result_, result, ~
	IniWrite, %result_1%, reporting.ini, Reporting%A_MM%-%A_DD%-%A_Hour%-%A_Min%
	if(result_1 == 1)
	{
		AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast bereits " FormatNumber(result_2) " Aufträge angenommen")
		url := ""
		result := ""
		url = http://wheelman.jameschans.de/keybinder/dm/dangen.php?name=%username%
		URLDownloadToVar(url, result)
		StringSplit, result, result, ~
		AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wochenaufträge: " FormatNumber(result2) " - Monatsaufträge: " FormatNumber(result3))
	} else {
		AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler. Bitte an John_Reese oder Pietro_Miller wenden.")
	}
}
return



;Whzurücklegen
HotKey16:
if(IsInChat())
	return
SendChat("/revert")
return

;CancelWheelman
HotKey17:
if(IsInChat())
	return
SendChat("/cancel wheelman")
return

;Ausrüsten Prof 1
HotKey18:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil1_1 . " " . Profil1_2 . " " . Profil1_3 . " " . Profil1_4 . " " . Profil1_5 . " " . Profil1_6 . " " . Profil1_7 . "")
Sleep, 500
SendChat("/heal")
return

;Ausrüsten Prof 2
HotKey19:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil2_1 . " " . Profil2_2 . " " . Profil2_3 . " " . Profil2_4 . " " . Profil2_5 . " " . Profil2_6 . " " . Profil2_7 . "")
Sleep, 500
SendChat("/heal")
return

;Contracts
HotKey20:
if(IsInChat())
	return
if(oldcontracts == 1)
{
	SendChat("/oldcontracts")
}
else
{
	SendChat("/contracts")
}
return

;Mask
HotKey21:
if(IsInChat())
	return
SendChat("/mask")
return

;Tor Auf
Hotkey22:
if(IsInChat())
	return
SendChat("/auf")
return

;Keybinder Pauseren
Hotkey23:
Suspend 
If (A_IsSuspended)
{
ShowGameText("~r~Keybinder ~r~ deaktiviert", 2000, 3)
paused = 1
Suspend permit
}
if (!A_IsSuspended)
{
ShowGameText("~g~Keybinder ~g~ aktiviert", 2000, 3)
paused = 0
Suspend off
}
return

HotKey24:
if(IsPlayerInAnyVehicle() && IsPlayerDriver())
{
	if(IsPlayerInRangeOfPoint(614.7936,1689.5481,6.5567, 10) || IsPlayerInRangeOfPoint(-1328.5437,2677.2109,49.6285, 10) || IsPlayerInRangeOfPoint(1595.7455,2198.9319,10.3875, 10) || IsPlayerInRangeOfPoint(2202.3479,2473.9041,10.3849, 10) || IsPlayerInRangeOfPoint(2113.8887,920.1363,10.3840, 10) || IsPlayerInRangeOfPoint(-2408.7478,975.8612,44.8655, 10) || IsPlayerInRangeOfPoint(-2029.3025,156.4132,28.4108, 10) || IsPlayerInRangeOfPoint(-1676.3165,414.2832,6.7490, 10) || IsPlayerInRangeOfPoint(1004.1802,-939.2733,41.7504, 10) || IsPlayerInRangeOfPoint(1944.1013,-1772.9907,12.9622, 10) || IsPlayerInRangeOfPoint(-90.6283,-1169.5378,1.9707, 10) || IsPlayerInRangeOfPoint(-1605.3982,-2714.4424,48.5335, 10) || IsPlayerInRangeOfPoint(-2243.8896,-2560.5569,31.9219, 10) || IsPlayerInRangeOfPoint(1380.9418,457.1429,19.4861, 10) || IsPlayerInRangeOfPoint(70.4341,1218.6842,18.3743, 10) || IsPlayerInRangeOfPoint(1555.4310,-1605.5901,13.1827, 10))
	{
		if(InStr(chat0, "Du bist an keiner Tankstelle."))
		{
			return
		}
		else if !Errorlevel
		{
		if(getVehicleEngineState() == 1)
		{
		SendChat("/motor")
		}
		SendChat("/fill")
		Sleep, 10000
		SendChat("/motor")
		Sleep, 2600
		SendChat("/licht")
		}
	} else if(IsPlayerInRangeOfPoint(1733.4684,546.3726,26.2758, 10) || IsPlayerInRangeOfPoint(1741.1063,543.4731,26.3013, 10) || IsPlayerInRangeOfPoint(1744.0303,523.6337,27.3567, 10) || IsPlayerInRangeOfPoint(1752.7092,521.6908,27.3102, 10) || IsPlayerInRangeOfPoint(512.5435,476.6207,18.4921, 10) || IsPlayerInRangeOfPoint(529.2228,467.2050,18.5020, 10) || IsPlayerInRangeOfPoint(-159.7899,414.1762,11.6441, 10) || IsPlayerInRangeOfPoint(-157.4410,392.2368,11.6423, 10) || IsPlayerInRangeOfPoint(-1408.2322,824.1868,46.9611, 10) || IsPlayerInRangeOfPoint(-1414.7716,803.5920,46.8070, 10) || IsPlayerInRangeOfPoint(-2695.0493,1284.6304,54.9936, 10) || IsPlayerInRangeOfPoint(-2686.3394,1284.2363,54.9928, 10) || IsPlayerInRangeOfPoint(-2676.6162,1265.3683,54.9934, 10) || IsPlayerInRangeOfPoint(-2668.1848,1264.9076,54.9993, 10) || IsPlayerInRangeOfPoint(-963.0773,-343.0494,35.6944, 10) || IsPlayerInRangeOfPoint(-967.9983,-322.3340,35.9383, 10) || IsPlayerInRangeOfPoint(-71.7615,-892.4689,15.3092, 10) || IsPlayerInRangeOfPoint(-68.7422,-867.9615,14.0653, 10) || IsPlayerInRangeOfPoint(100.1979,-1284.3651,13.6976, 10) || IsPlayerInRangeOfPoint(94.4024,-1277.8165,13.6380, 10) || IsPlayerInRangeOfPoint(97.1871,-1254.1139,14.2317, 10) || IsPlayerInRangeOfPoint(94.6934,-1245.5920,14.2429, 10) || IsPlayerInRangeOfPoint(42.7052,-1537.9767,4.7632, 10) || IsPlayerInRangeOfPoint(58.0220,-1524.9335,4.5461, 10))
{
	{
		SendChat("/zoll")
	} 
}
}
return

Xtaste:
GetChatline(0, line)
if(IsPlayerInAnyVehicle() && IsPlayerDriver())
{
	if(IsPlayerInRangeOfPoint(614.7936,1689.5481,6.5567, 10) || IsPlayerInRangeOfPoint(-1328.5437,2677.2109,49.6285, 10) || IsPlayerInRangeOfPoint(1595.7455,2198.9319,10.3875, 10) || IsPlayerInRangeOfPoint(2202.3479,2473.9041,10.3849, 10) || IsPlayerInRangeOfPoint(2113.8887,920.1363,10.3840, 10) || IsPlayerInRangeOfPoint(-2408.7478,975.8612,44.8655, 10) || IsPlayerInRangeOfPoint(-2029.3025,156.4132,28.4108, 10) || IsPlayerInRangeOfPoint(-1676.3165,414.2832,6.7490, 10) || IsPlayerInRangeOfPoint(1004.1802,-939.2733,41.7504, 10) || IsPlayerInRangeOfPoint(1944.1013,-1772.9907,12.9622, 10) || IsPlayerInRangeOfPoint(-90.6283,-1169.5378,1.9707, 10) || IsPlayerInRangeOfPoint(-1605.3982,-2714.4424,48.5335, 10) || IsPlayerInRangeOfPoint(-2243.8896,-2560.5569,31.9219, 10) || IsPlayerInRangeOfPoint(1380.9418,457.1429,19.4861, 10) || IsPlayerInRangeOfPoint(70.4341,1218.6842,18.3743, 10) || IsPlayerInRangeOfPoint(1555.4310,-1605.5901,13.1827, 10))
	{
		AddChatMessage("Du kannst jetzt dein Fahrzeug betanken. Drück '{FFBF00}" . HotKey24 . "{FFFFFF}' zum bestätigen.")
		return
	}else if(IsPlayerInRangeOfPoint(1733.4684,546.3726,26.2758, 10) || IsPlayerInRangeOfPoint(1741.1063,543.4731,26.3013, 10) || IsPlayerInRangeOfPoint(1744.0303,523.6337,27.3567, 10) || IsPlayerInRangeOfPoint(1752.7092,521.6908,27.3102, 10) || IsPlayerInRangeOfPoint(512.5435,476.6207,18.4921, 10) || IsPlayerInRangeOfPoint(529.2228,467.2050,18.5020, 10) || IsPlayerInRangeOfPoint(-159.7899,414.1762,11.6441, 10) || IsPlayerInRangeOfPoint(-157.4410,392.2368,11.6423, 10) || IsPlayerInRangeOfPoint(-1408.2322,824.1868,46.9611, 10) || IsPlayerInRangeOfPoint(-1414.7716,803.5920,46.8070, 10) || IsPlayerInRangeOfPoint(-2695.0493,1284.6304,54.9936, 10) || IsPlayerInRangeOfPoint(-2686.3394,1284.2363,54.9928, 10) || IsPlayerInRangeOfPoint(-2676.6162,1265.3683,54.9934, 10) || IsPlayerInRangeOfPoint(-2668.1848,1264.9076,54.9993, 10) || IsPlayerInRangeOfPoint(-963.0773,-343.0494,35.6944, 10) || IsPlayerInRangeOfPoint(-967.9983,-322.3340,35.9383, 10) || IsPlayerInRangeOfPoint(-71.7615,-892.4689,15.3092, 10) || IsPlayerInRangeOfPoint(-68.7422,-867.9615,14.0653, 10) || IsPlayerInRangeOfPoint(100.1979,-1284.3651,13.6976, 10) || IsPlayerInRangeOfPoint(94.4024,-1277.8165,13.6380, 10) || IsPlayerInRangeOfPoint(97.1871,-1254.1139,14.2317, 10) || IsPlayerInRangeOfPoint(94.6934,-1245.5920,14.2429, 10) || IsPlayerInRangeOfPoint(42.7052,-1537.9767,4.7632, 10) || IsPlayerInRangeOfPoint(58.0220,-1524.9335,4.5461, 10))
	{
		AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Möchtest du den Zoll jetzt öffnen? Zum öffnen '{FFBF00}" . HotKey24 . "{FFFFFF}' drücken.")
		return
	}
}
return
	

	
;10 Selbst Belegbare

HotKey25:
printHotkey(25)
return
HotKey26:
printHotkey(26)
return
HotKey27:
printHotkey(27)
return
HotKey28:
printHotkey(28)
return
HotKey29:
printHotkey(29)
return
HotKey30:
printHotkey(30)
return
HotKey31:
printHotkey(31)
return
HotKey32:
printHotkey(32)
return
HotKey33:
printHotkey(33)
return
HotKey34:
printHotkey(33)
return
return
HotKey35:
printHotkey(35)
return

; eject Platz 2
~e & ~1::
psg := GetSeatIDs()
if(IsInChat())
	return
if(psg[2] != -1)
{	
SendChat("/eject "psg[2])
}
return
; eject Platz 3
~e & ~2::
psg := GetSeatIDs()
if(IsInChat())
	return
if(psg[3] != -1)
{
SendChat("/eject "psg[3])
}
return
; eject Platz 4
~e & ~3::
psg := GetSeatIDs()
if(IsInChat())
	return
if(psg[4] != -1)
{
SendChat("/eject "psg[4])
}
return
*/

;Festgeld anlegen
:?:/fg::
SendChat("/festgeld " fg)
return

; GK suche
:?:/gk::
Suspend Permit
gk := PlayerInput("Welchen GK suchst du? ")
if(gk=="")
return
gk_search(gk)
return

;Taschenrechner
:?:/tr::
:?:/taschenrechner::
:?:/rechner::
Suspend Permit

Zahl1 := PlayerInput("Zahl 1: ")
AddChatMessage("Es gibt folgende Aktionen: + - * /") 
Aktion := PlayerInput("Aktion: ")
Zahl2 := PlayerInput("Zahl 2: ")
if (Aktion = "+")
{
StringSplit, calc, Aktion, +
calcresult := Round(Zahl1 + Zahl2, 3)
}
if (Aktion = "-")
{
StringSplit, calc, Aktion, -
calcresult := Round(Zahl1 - Zahl2, 3)
}
if (Aktion = "*")
{
StringSplit, calc, Aktion, *
calcresult := Round(Zahl1 * Zahl2, 3)
}
if (Aktion = "/")
{
StringSplit, calc, Aktion, /
calcresult := Round(Zahl1 / Zahl2, 3)
}
AddChatMessage("Das Ergebnis lautet: {01DF01}" . calcresult . "")
return

;Anrufzeug
:?:/p::
SendChat("/p")
SendChat("Guten Tag, Sie sind verbunden mit " name ".")
SendChat("Was kann ich für Sie tun?")
return

:?:/h::
SendChat("Vielen Dank für Ihren Anruf.")
SendChat("/h")
return



;Ksms
:?:/ksms::
Suspend, Permit
pinput := PlayerInput("Name: ")
SendChat("/number " . pinput . "")
Loop,
{
        GetChatLine(0, line)
        if(InStr(line, "Name: "))
        {
                RegExMatch(line, "Name: (.*), Ph: (.*)", Output)
                SendInput, t/sms %Output2%{space}
                return
                }
                else If(InStr(line, "Diesen Spieler gibt es nicht!"))
                {
                        AddChatMessage("Versendung nicht möglich!")
                        return
                }
                else
                {
                        continue
                }
}
return

;Time in F-Chat
:?:/ftime::
    Suspend Permit
    SendChat("/time")
    Sleep, 100
    adrGTA2 := getModuleBaseAddress("gta_sa.exe", hGTA)
    cText := readString(hGTA, adrGTA2 + 0x7AAD43, 512)
    if(instr(cText, "In Behandlung")) {
        RegExMatch(cText, "(.*)In Behandlung: (\d+)", ausgabe)
        newText2 := ""
        zeit := sekunden(ausgabe2)
        SendChat("/f ~Ich bin noch " . zeit . " in Behandlung")
        StringReplace, newText2, cText, In Behandlung: %ausgabe2% Sekunden, Noch %zeit% im KH
        writeString(hGTA, adrGTA2 + 0x7AAD43, newText2)
    } else if(instr(cText, "Knastzeit")) {
        RegExMatch(cText, "(.*)Knastzeit: (\d+)", ausgabe)
        newText2 := ""
        zeit := sekunden(ausgabe2)
        SendChat("/f Ich befinde mich noch " . zeit . " im Knast")
        StringReplace, newText2, cText, Knastzeit: %ausgabe2% Sekunden, Noch %zeit% im Knast
        writeString(hGTA, adrGTA2 + 0x7AAD43, newText2)
    }
return

;CountDown
 :?:/cd::
Suspend Permit
zahli := 0
AddChatMessage(" Gib eine Zahl für deinen Countdown ein")
zahl := PlayerInput("/Countdown: ")
AddChatMessage(" Du kannst den Countdown mit '{FFBF00}<{FFFFFF}' beenden.")
;SendChat("Countdown startet!")
Sleep 1000
Loop, %zahl%
{
	Sendchat("/s << " zahl " >>")
	zahl--
	KeyWait, <, D T1
	If !ErrorLevel
	{
		return
	}
	Sleep 100
}
AddChatMessage("Freigegeben")
return

;Random Loto
:?:/alotto::
Suspend Permit
Random, rand, 1, 200
SendChat("/lotto " rand)
return

;Ausrüsten Alles
:?:/aall::
Suspend, Permit
SendChat("/ausruesten all")
return

; Linkgrabber
:?:/link::
Suspend Permit
GetChatLine(0, Link)
IfInString, Link, http
{
res :=  SubStr(Link,(s := InStr(Link,"http://")),InStr(Link,"/",0,1,3) - s + 1)
If(!InStr(Link, radio))
AddChatMessage("[Link] Es wurde ein Link erkannt und in der Zwischenablage gespeichert")
Clipboard := res
}
return

;Eigene AD
:?:/sad::
Suspend Permit
SendChat("/ad " . Werbung . "")
return

;Interne Stats //////////// muss noch überarbetet werden
:?:/agstats::
username := GetUsername()
url = http://wheelman.jameschans.de/keybinder/stats.php?name=%username%
URLDownloadToVar(url, result)
StringSplit, result_, result, ~
AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Deine Wheelman Statistiken")
AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Angenommen`t`tAusgeführt`t`tGehackt`t`tEinnahmen:")
AddChatMessage("|{01DF01}Wheelman{FFFFFF}| " FormatNumber(result_1) "`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_2) "`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_3) "`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_4) "$")
return

;Accept All
:?:/ac::
Suspend Permit
Loop, read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
{
    If InStr(A_LoopReadLine, "/accept drugs")
    {
        Service = drugs
    }
    else If InStr(A_LoopReadLine, "/accept kaution cash")
    {
        Service = kaution
    }else If InStr(A_LoopReadLine, "/accept weapon")
    {
        Service = weapon
    }
	else If InStr(A_LoopReadLine, "/accept live")
    {
        Service = live
    }
    else If InStr(A_LoopReadLine, "/accept repair")
    {
        Service = repair
    }
    else If InStr(A_LoopReadLine, "/accept refill")
    {
        Service = refill
    }
    else If InStr(A_LoopReadLine, "/accept taxi")
    {
        Service = taxi
    }
    else If InStr(A_LoopReadLine, "/accept medic")
    {
        Service = medic
    }
    else If InStr(A_LoopReadLine, "/accept ticket")
    {
        Service = ticket
    }
        else If InStr(A_LoopReadLine, "/accept dice")
        {
                Service = dice
        }
        else If InStr(A_LoopReadLine, "/accept stats")
        {
                Service = stats
        }
        else If InStr(A_LoopReadLine, "/accept paket")
        {
                Service = paket
        }
}
SendChat("/accept " Service "")
return


:?:/af::
:?:/afind::
Suspend Permit
Suspend On
SendInput, /find{space}
Input, AID, V I M,{enter}
Send {enter}
SetTimer, Find, 6000
SetTimer, GK, 1000
Suspend Off
AddChatMessage("Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
return

:?:/as::
:?:/ashow::
Suspend Permit
SendInput, /showpos{space}
Input, AID, V I M,{enter}
Send {enter}
SetTimer, Show, 6000
SetTimer, GK, 1000
Suspend Off
AddChatMessage("Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
return

Find:
SendChat("/find " . AID)
return
Show:
SendChat("/showpos " . AID)
return
GK:
GetChatLine(0, Chatline)
if(InStr(Chatline, "Der Spieler befindet sich in") && InStr(Chatline, "Gebäudekomplex"))
{
	RegExMatch(Chatline, "Der Spieler befindet sich in Gebäudekomplex (.*)", params) 
	GKID := params1
	gk_search(GKID)
}
return

antiSpam:
if(!WinActive("GTA:SA:MP"))
	return
GetChatLine(0, Chatline__)
GetChatLine(1, Chatline_)
Chatline := Chatline_ Chatline__
if(InStr(Chatline, "WARNUNG: Hör auf zu Spamen, sonst wirst du gekickt!")){
	if(InStr(Chatline, "sagt:") || InStr(Chatline, "schreit:") || InStr(Chatline, "**(("))
		return
	BlockChatInput()
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}|Anti-Spam Schutz aktiviert.")
	sleep, 3000
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}|Anti-Spam Schutz deaktiviert.")
	unblockChatInput()
}
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Fisch
:?:/vrk::
:?:/asell::
Suspend Permit
GetChatLine(0, Line1)
sleep 50
SendChat("/sell fish 1")
if(InStr(Line1, "Du bist in keinem 24-7!"))
	return
SendChat("/sell fish 2")
if(InStr(Line1, "Du bist in keinem 24-7!"))
	return
sleep, 1000
SendChat("/sell fish 3")
if(InStr(Line1, "Du bist in keinem 24-7!"))
	return
SendChat("/sell fish 4")
if(InStr(Line1, "Du bist in keinem 24-7!"))
	return
sleep, 1000
SendChat("/sell fish 5")
if(InStr(Line1, "Du bist in keinem 24-7!"))
	return
sleep, 100
gesamtmoney:=0
gesamtlbs:=0
counter:=0
Loop, 25
{
	GetChatLine(A_Index-1, Chatline)
	if(InStr(Chatline,"Du hast deinen")){
		RegExMatch(Chatline, "Du hast deinen (.*) \((.*) LBS\) für (.*)\$ verkauft\.", var)
		gesamtmoney:=gesamtmoney+var3
		gesamtlbs:=gesamtlbs+var2
		counter++
		if(counter==5)
			break
	}
}
AddChatMessage("Du hast alle deine Fische verkauft! ($" . gesamtmoney . ")")
return     
return


/*
InteriorID := 24/7 == ID:10


*/


:?:/FishHP::
Suspend Permit
angelType := 1
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch weg, der die wenigsten HP bringt.")
return

:?:/FishGeld::
Suspend Permit
angelType := 2
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch mit den billigstens Verkaufpreis weg.")
return

:?:/FishNix::
Suspend Permit
angelType := 3
AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' keinen Fisch weg")
return

:?:/fish::
:?:/afish::
Suspend Permit
sleep 50
if(IsPlayerInRangeOfPoint(378.383605, -2085.143310, 7.387549, 50) || IsPlayerInRangeOfPoint(-2075.935546, 1434.549194, 7.101562, 50) || IsPlayerInRangeOfPoint(1600.157592, 602.537170, 7.780212, 50))
{
	Loop {
		SendChat("/fish")
		sleep, 100
		GetChatLine(0,Chatline)
		if(!InStr(Chatline, "gefangen")){
			if(InStr(Chatline,"Du bist an keinem Angelplatz (Big Wheel Rods) oder an einem Fischerboot!")){
				return
			}else if(InStr(Chatline,"Du kannst nur 5 Fische bei dir tragen.")){
				SendChat("/fishes")
				sleep, 500
				if(angelType == 1){
					lowestLBS := 999
					lowestFish := 1
					Loop, 5
					{
						GetChatLine(A_Index, Chatline)
						RegExMatch(Chatline, "\*\* \(([0-9]+)\) Fisch\: (.*) \(([0-9]+) LBS\)", fishes_var)
						if(fishes_var3 <= lowestLBS){
							lowestLBS := fishes_var3
							lowestFish := fishes_var1
							lowestFishName := fishes_var2
						}
					}
					SendChat("/releasefish " . lowestFish)
					AddChatMessage("Du hast ein " . lowestFishName . " mit " . lowestLBS . " LBS weggeworfen.")
					
				}else if(angelType == 2){
					lowestPrice := 5000
					lowestFish := 1
					Loop, 5
					{
						GetChatLine(A_Index, Chatline)
						RegExMatch(Chatline, "\*\* \(([0-9]+)\) Fisch\: (.*) \(([0-9]+) LBS\)", fishes_var)
						price := GetFishPrice(fishes_var2, fishes_var3)
						if(price <= lowestPrice){
							lowestPrice := price
							lowestFish := fishes_var1
							lowestFishName := fishes_var2
						}
					}
					SendChat("/releasefish " . lowestFish)
					AddChatMessage("Du hast ein " . lowestFishName . " mit dem Verkaufs-Preis " . lowestPrice . "$ weggeworfen.")
				} else if(angelType == 3){
					moneyGesamt := 0
					healthGesamt := 0
					Loop, 5
					{
						GetChatLine(A_Index, Chatline)
						RegExMatch(Chatline, "\*\* \(([0-9]+)\) Fisch\: (.*) \(([0-9]+) LBS\)", fishes_var)
						if(fishes_var3 < 20)
							continue
						if(fishes_var2 == "Nichts"){
							continue
						}else if(fishes_var2 == "Bernfisch"){
							moneyGesamt += Floor(fishes_var3 * 1)
						}else if(fishes_var2 == "Blauer Fächerfisch"){
							moneyGesamt += Floor(fishes_var3 * 2)
						}else if(fishes_var2 == "Schwertfisch" || fishes_var2 == "Zackenbarsch" || fishes_var2 == "Roter Schnapper"){
							moneyGesamt += Floor(fishes_var3 * 3)
						}else if(fishes_var2 == "Katzenfisch"){
							moneyGesamt += Floor(fishes_var3 * 4)
						}else if(fishes_var2 == "Forelle"){
							moneyGesamt += Floor(fishes_var3 * 5)
						}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
							moneyGesamt += Floor(fishes_var3 * 7)
						}else if(fishes_var2 == "Makrele"){
							moneyGesamt += Floor(fishes_var3 * 8)
						}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
							moneyGesamt += Floor(fishes_var3 * 9)
						}else if(fishes_var2 == "Schildkröte"){
							moneyGesamt += Floor(fishes_var3 * 10)
						}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
							moneyGesamt += Floor(fishes_var3 * 12)
						}else{
							AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
							AddChatMessage("Es wäre nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken könntest")
							AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
							AddChatMessage(" Vielen Dank!")
							continue
						}
						healthGesamt += Floor(fishes_var3 * 0.3)
					}
					
					AddChatMessage("Die Fische würden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
					break
				}
			}else if(InStr(Chatline, "Du kannst erst in")){
				SendChat("/fishes")
				sleep, 250
				moneyGesamt := 0
				healthGesamt := 0
				Loop, 5
				{
					GetChatLine(A_Index, Chatline)
					RegExMatch(Chatline, "\*\* \(([0-9]+)\) Fisch\: (.*) \(([0-9]+) LBS\)", fishes_var)
					if(fishes_var3 < 20)
						continue
					if(fishes_var2 == "Nichts"){
						continue
					}else if(fishes_var2 == "Bernfisch"){
						moneyGesamt += Floor(fishes_var3 * 1)
					}else if(fishes_var2 == "Blauer Fächerfisch"){
						moneyGesamt += Floor(fishes_var3 * 2)
					}else if(fishes_var2 == "Schwertfisch" || fishes_var2 == "Zackenbarsch" || fishes_var2 == "Roter Schnapper"){
						moneyGesamt += Floor(fishes_var3 * 3)
					}else if(fishes_var2 == "Katzenfisch"){
						moneyGesamt += Floor(fishes_var3 * 4)
					}else if(fishes_var2 == "Forelle"){
						moneyGesamt += Floor(fishes_var3 * 5)
					}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
						moneyGesamt += Floor(fishes_var3 * 7)
					}else if(fishes_var2 == "Makrele"){
						moneyGesamt += Floor(fishes_var3 * 8)
					}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
						moneyGesamt += Floor(fishes_var3 * 9)
					}else if(fishes_var2 == "Schildkröte"){
						moneyGesamt += Floor(fishes_var3 * 10)
					}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
						moneyGesamt += Floor(fishes_var3 * 12)
					}else{
						AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
						AddChatMessage("Es wäre nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken könntest")
						AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
						AddChatMessage(" Vielen Dank!")
						continue
					}
					healthGesamt += Floor(fishes_var3 * 0.3)
				}
				AddChatMessage("Die Fische würden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
				return
			}
		}
		sleep, 800
	}
} else {
	SendChat("/fish")
}
return

:?:/fische::
Suspend, Permit
SendChat("/fishes")
moneyGesamt := 0
healthGesamt := 0
Sleep 500
Loop, 5
{
	GetChatLine(A_Index, Chatline)
	RegExMatch(Chatline, "\*\* \(([0-9]+)\) Fisch\: (.*) \(([0-9]+) LBS\)", fishes_var)
	if(fishes_var3 < 20)
		continue
	if(fishes_var2 == "Nichts"){
		continue
	}else if(fishes_var2 == "Bernfisch"){
		moneyGesamt += Floor(fishes_var3 * 1)
	}else if(fishes_var2 == "Blauer Fächerfisch"){
		moneyGesamt += Floor(fishes_var3 * 2)
	}else if(fishes_var2 == "Schwertfisch" || fishes_var2 == "Zackenbarsch" || fishes_var2 == "Roter Schnapper"){
		moneyGesamt += Floor(fishes_var3 * 3)
	}else if(fishes_var2 == "Katzenfisch"){
		moneyGesamt += Floor(fishes_var3 * 4)
	}else if(fishes_var2 == "Forelle"){
		moneyGesamt += Floor(fishes_var3 * 5)
	}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
		moneyGesamt += Floor(fishes_var3 * 7)
	}else if(fishes_var2 == "Makrele"){
		moneyGesamt += Floor(fishes_var3 * 8)
	}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
		moneyGesamt += Floor(fishes_var3 * 9)
	}else if(fishes_var2 == "Schildkröte"){
		moneyGesamt += Floor(fishes_var3 * 10)
	}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
		moneyGesamt += Floor(fishes_var3 * 12)
	}else{
		AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
		AddChatMessage("Es wäre nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken könntest")
		AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
		AddChatMessage(" Vielen Dank!")
		continue
	}
	healthGesamt += Floor(fishes_var3 * 0.3)
}
AddChatMessage("Die Fische würden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
return

:?:/acook::
:?:/kochen::
Suspend Permit
SendChat("/cook fish 1")
SendChat("/cook fish 2")
sleep, 1000
SendChat("/cook fish 3")
SendChat("/cook fish 4")
sleep, 1000
SendChat("/cook fish 5")
sleep, 150
j := 0
gesamt_HP := 0
Loop, 15
{
i := A_Index - 1
GetChatLine(i, Chatline)
if(InStr(Chatline, "* Du hast ein/e") && InStr(Chatline, " LBS gekocht.")){
j++
RegExMatch(Chatline, "\* Du hast ein\/e (.*) mit ([0-9]+) LBS gekocht.", fishes_)
fish_HP := Floor(fishes_2 * 0.3)
gesamt_HP += fish_HP
SetChatLine(i, "* Du hast ein/e " . fishes_1 . " mit " . fishes_2 . " LBS gekocht. (" . fish_HP . " HP)")
}
if(j == 5)
break
}
sleep, 15
AddChatMessage( "Es wurden alle Fische gekocht. Die Fische bringen " . gesamt_HP . " HP.")
return

:?:/cooked::
:?:/hp::
SendChat("/cooked")
Sleep 250
HP = 0
Loop, 5{
	GetChatLine(A_Index, fisch)
	RegExMatch(fisch, "\Q** (\E(.*)\Q) Hergestellt: gekochten \E(.*) \((.*) LBS\)", fisch%A_Index%_)
	HP%A_Index% := Floor(fisch%A_Index%_3 * 0.3)
	HP += HP%A_Index%
}
Loop, 5{
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}|" . fisch%A_Index%_1 . " (" . fisch%A_Index%_2 . " LBS) - {FFA000} " . HP%A_Index% . " HP")
}

AddChatMessage( "|{01DF01}Wheelman{FFFFFF}|Die Fische bringen dir Gesamt: {FFA000}" . HP . " HP")
return




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Vorrübergehende Copliste

:?:/cops::
copscount := 0
UrlDownloadToVar("http://wheelman.jameschans.de/keybinder/allcops.php", result)
cops := "Name `t`t`t`t`tID`n"
if(coplist == 1){
	Loop, Parse, result, ~
	{
		RegExMatch(A_LoopField, "(\S+)", member)
		id := getPlayerIdByName(member1)
		if (member1 != "") {
			if (id != -1) {
				if (StrLen(member1) > 13) {
				tab := "`t`t"
				} else if (StrLen(member1) > 6 && StrLen(member1) < 13) {
				tab := "`t`t`t`t"
				} else if(StrLen(member1) == 13){
				tab := "`t`t`t"
				} else {
				tab := "`t`t`t"	
				}
				;AddChatMessage(member1 . " [ID: " . id "]")
				cops .= "`n{0B610B}" . member1 . "{FF8000}" . tab "" . id
				copscount++
			}
		}
	}
	title := "Copliste"
	ShowDialog(0, title, cops, "OK")
	
	} else if(coplist == 2){
	Loop, Parse, result, ~
	{
		RegExMatch(A_LoopField, "(\S+)", member)
		id := getPlayerIdByName(member1)
		if (member1 != "") {
			if (id != -1) {
				if (StrLen(member1) > 14) {
				tab := "`t"
				} else if (StrLen(member1) > 6) {
				tab := "`t`t"
				} else {
				tab := "`t`t`t"
				}
				AddChatMessage("{0B610B} " . member1 . "{FF8000}" . tab "`t`t [ID: " . id "]")
				copscount++
				
			}
		}
	}
}
if(copscount != 0)
{
	AddChatMessage(" Es sind " copscount " Cops online")
} else if(copscount == 0){
	AddChatMessage(" Es sind 0 Cops online")
}
return

:?:/addcop::
Suspend Permit
playername := GetUsername()
cname := PlayerInput("/Cop-Name: ")
url = http://wheelman.jameschans.de/keybinder/addcop.php?name=%cname%&uname=%playername%
URLDownloadToVar(url, result)
if(result == 1 || result == 11)
{
	AddChatMessage(" Du hast den Cop " cname " hinzugefügt")
} else {
	AddChatMessage(" Fehler: " result)
}
return

:?:/delcop::
Suspend Permit
username := GetUsername()
cname := PlayerInput("/Cop-Name: ")
url = http://wheelman.jameschans.de/keybinder/delcop.php?name=%cname%&uname=%username%
URLDownloadToVar(url, result)
if(result == 1)
{
	AddChatMessage(" Du hast den Cop " cname " gelöscht")
}  else {
	AddChatMessage(" Fehler: " result)
}
return

:?:/relog::
AddChatMessage(" Du verbindest nun neu...")
restart()
return


:?:/re::
:?:/resms::
Loop, Read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
{
        if (RegExMatch(A_LoopReadLine, "SMS: (.+), Sender: (\S+) \((\d+)\)")) {
                RegExMatch(A_LoopReadLine, "SMS: (.+), Sender: (\S+) \((\d+)\)", sms_)
        } else if (RegExMatch(A_LoopReadLine, "SMS: (.+)\.\.\.")) {
        }
}
        if (sms_2 != "" && sms_2 != GetUsername()) {
        AddChatMessage("Letzte SMS (von " . sms_2 . "):")
        AddChatMessage(sms_1)
        SendInput /sms %sms_3%{space}
        } else {
        AddChatMessage("Keiner hat dich angeschrieben!")
}
return


fee:
GetChatLine(1, line2)
if(InStr(line2, "Du hast deinen heutigen Aktivitätsbonus"))
{
SendChat("/fee " . FeeEinstellung . "")
} 
return

clearvariable:
urli := ""
money_ := ""
money_1 := ""
money_2 := ""
resultm := ""
resultm_1 := ""
resultm_2 := ""
result := ""
result_ := ""
result_1 := ""
result_2 := ""
line3name := ""
line2name := ""
line1name := ""
url := ""
resulti := ""
line3name := ""
line2name := ""
line1name := ""
return

Grabben:
zone := GetPlayerZone()
 City := GetPlayerCity()
GetChatLine(1, line)
if(InStr(line, "* Du versuchst") && InStr(line, "in dein Fahrzeug zu ziehen."))
{
	SendChat("/f Ich versuche den Kunden rauszuziehen, bitte PD blockieren. |  Pos: "zone " "City "")
    Sleep 1000
    ShowGameText("~g~5 ~g~", 1000, 3) 
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		return
	}	
    Sleep 1000
    ShowGameText("~g~4 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~3 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~2 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~1 ~g~", 1000, 3)
}
GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		return
	}
; Bei Grabben Timer nach der letzten }
GetChatLine(0, line1)
if(InStr(line1, "steigt in dein Fahrzeug ein und zahlt"))
{
		RegExMatch(line1, "(.*) steigt in dein Fahrzeug ein und zahlt (.*)\$", money_)
		urli = http://wheelman.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_2%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
        SendChat("/f Ich habe den Kunden " money_1 " erfolgreich befreit. Danke!")
		url = http://wheelman.jameschans.de/keybinder/ausge.php?name=%username%
		result := ""
		result_1 := ""
		URLDownloadToVar(url, result)
		StringSplit, result, result, ~
		
		if(result1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast schon " FormatNumber(result2) " Personen befreit und " FormatNumber(resultm_2) "$ verdient.")
			
			url = http://wheelman.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = http://wheelman.jameschans.de/keybinder/dm/dausge.php?name=%username%
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wochengrabs: " resulti2 " - Monatsgrabs: " resulti3)
		} else {
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler. Bitte an Pietro_Miller oder John_Reese wenden.")
		}
}

return   

hacken: ; Nach XTasten Timer
GetChatLine(0, line1)
GetChatLine(1, line2)
GetChatLine(2, line3)
name := GetUsername()

If(InStr(line1, "hat einen Eintrag entfernt") || InStr(line2, "hat einen Eintrag entfernt") || InStr(line3, "hat einen Eintrag entfernt")){
	if(InStr(line1, "hat einen Eintrag entfernt. Verbleibend:") && !InStr(line2, "hat einen Eintrag entfernt. Verbleibend:") && !InStr(line3, "hat einen Eintrag entfernt. Verbleibend:"))
	{
		
		RegExMatch(line1, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", money_)
		line1name := money_1
		
		if(line1name == line2name || line1name == line3name || line1name == ""){
			return
		}
		urli = http://wheelman.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_2%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = http://wheelman.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=1
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		if(result_1 == 11 && resultm_1 == 1 || result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
			
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = http://wheelman.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = http://wheelman.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=1
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			if(result1 == 11 && resulti1 == 1 || result1 == 1 && resulti1 == 1){
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
		}
	}
	if(InStr(line1, "hat einen Eintrag entfernt. Verbleibend: ") && InStr(line2, "hat einen Eintrag entfernt. Verbleibend:") && !InStr(line3, "hat einen Eintrag entfernt. Verbleibend:"))
	{
		RegExMatch(line2, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", moneyl2_)
		RegExMatch(line1, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", moneyl1_)
		line2name := moneyl2_1
		line1name := moneyl1_1
		money_gesamt := 0
		if(line2name == line1name || line2name == line3name || line2name == "" || line1name == ""){
			return
		}
		money_gesamt += moneyl2_2
		money_gesamt += moneyl1_2
		urli = http://wheelman.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_gesamt%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = http://wheelman.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=2
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		if(result_1 == 11 && resultm_1 == 1 || result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = http://wheelman.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = http://wheelman.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=2
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			if(result1 == 11 && resulti1 == 1 || result1 == 1 && resulti1 == 1){
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
		}
	}
	if(InStr(line1, "hat einen Eintrag entfernt. Verbleibend: ") && InStr(line2, "hat einen Eintrag entfernt. Verbleibend:") && InStr(line3, "hat einen Eintrag entfernt. Verbleibend:"))
	{
		RegExMatch(line3, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", moneyl3_)
		RegExMatch(line2, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", moneyl2_)
		RegExMatch(line1, "(.*) hat einen Eintrag entfernt. Verbleibend: .* \(\+(.+)\$\)", moneyl1_)
		line3name := moneyl3_1
		line2name := moneyl2_1
		line1name := moneyl1_1
		money_gesamt := 0
		
		if(line3name == line2name || line3name == line1name || line2name == "" || line1name == "" || line3name == ""){
			return
		}
		money_gesamt += moneyl3_2
		money_gesamt += moneyl2_2
		money_gesamt += moneyl1_2
		
		urli = http://wheelman.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_gesamt%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = http://wheelman.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=3
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		if(result_1 == 11 && resultm_1 == 1 || result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
			
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = http://wheelman.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = http://wheelman.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=3
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			if(result1 == 11 && resulti1 == 1 || result1 == 1 && resulti1 == 1){
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
		}
	}
}
return



;~ Scripte



printHotkey(id) 
{
	if(IsInChat())
		return
	IniRead, command, Hotkeys.ini, Command, CMD%id%
	
	if(command == "[HEAL]") 
	{
		if(GetPlayerHealth() >= 100)
		{
			AddChatMessage("Du hast es nicht nötig, dich zu healen!")
			return
		}
		
		Loop 4
		{
			if(A_Index == 4)
			{
				AddChatMessage("Du hast keine HP-bringenden Items bei dir!")
				return
			}
			
			if(use%A_Index% == "Paket" && ersteHilfe) 
			{
				SendChat("/erstehilfe")
				return
			} 
			else if(use%A_Index% == "Drogen" && drogen > 0)
			{
				SendChat("/usedrugs")
				return
			}
			else if(use%A_Index% == "Fische" && fische > 0)
			{
				SendChat("/eat " . fische)
				return
			}
		}
	}	
	else if(command == "[MOTOR]")
	{
		if(!IsPlayerInAnyVehicle())
			return
		if(!(GetVehicleLockState() && !GetVehicleEngineState()))
			SendChat("/lock")
		SendChat("/motor")

		if(A_Hour >= 21 || A_Hour <= 6)
			SendChat("/licht")
	}
	else
	{
		;command := "Es folgt ein Countdown:[1000]~>> 3 <<[1000]~>> 2 <<[1000]~>> 1 <<[1000]~>> GO <<"
		StringReplace, command, command, [HP], % GetPlayerHealth()
		StringReplace, command, command, [Land], % GetPlayerZone()
		StringReplace, command, command, [Stadt], % GetPlayerCity()
		StringReplace, command, command, [Veh], % GetVehicleModelName()
		StringReplace, command, command, [VehHP], % Floor(GetVehicleHealth() / 10)
		StringReplace, command, command, [Kill], % kills
		StringReplace, command, command, [Death], % deaths
		StringReplace, command, command, [KD], % kills / deaths
		
		if(InStr(command, "~"))
		{
			StringSplit, command, command, ~
			
			Loop %command0%
			{
				if(RegExMatch(command%A_Index%, "\[SL(\d*)]", sleep)) 
					StringReplace, command%A_Index%, command%A_Index%, [SL%sleep1%],,
				SendChat(command%A_Index%)
				Sleep, %sleep1%
			}
		} 
		else
			SendChat(command)	
	}
}


FischPreis(FishName, FishLBS) {
	if(FishName == "Delphin")
		Preis := FishLBS*7
	else if(FishName == "Makrele")
		Preis := FishLBS*8
	else if(FishName == "Segelfisch")
		Preis := FishLBS*7
	else if(FishName == "Bernfisch")
		Preis := FishLBS*1
	else if(FishName == "Hai")
		Preis := FishLBS*7
	else if(FishName == "Schwertfisch")
		Preis := FishLBS*3
	else if(FishName == "Schildkröte")
		Preis := FishLBS*10
	else if(FishName == "Thunfisch")
		Preis := FishLBS*12
	else if(FishName == "Hecht")
		Preis := FishLBS*9
	else if(FishName == "Aal")
		Preis := FishLBS*9
	else if(FishName == "Forelle")
		Preis := FishLBS*5
	else if(FishName == "Wolfbarsch")
		Preis := FishLBS*12
	else if(FishName == "Zackenbarsch")
		Preis := FishLBS*3
	else if(FishName == "Katzenfisch")
		Preis := FishLBS*4
	else if(FishName == "Blauer Fächerfisch")
		Preis := FishLBS*2
	else if(FishName == "Roter Schnapper")
		Preis := FishLBS*3
	if(Preis == "")
		Preis := 0
	return Preis
}

sekunden(sek){
    min := floor(sek/60)    
    sek := mod(sek, 60)
    if(min == 0){
        return sek " Sek"
    }else{
        return min " Min, " sek " Sek"
    }
}


UrlDownloadToVar(URL, ByRef Result, UserAgent = "", Proxy = "", ProxyBypass = "") 
{
	hModule := DllCall("LoadLibrary", "Str", "wininet.dll")
	AccessType := Proxy != "" ? 3 : 1
	io := DllCall("wininet\InternetOpenA", "Str", UserAgent, "UInt", AccessType, "Str", Proxy, "Str", ProxyBypass, "UInt", 0)
	
	iou := DllCall("wininet\InternetOpenUrlA", "UInt", io, "Str", url, "Str", "", "UInt", 0, "UInt", 0x80000000, "UInt", 0)
	If (ErrorLevel != 0 or iou = 0) {
		DllCall("FreeLibrary", "UInt", hModule)
		return 0
	}
	
	VarSetCapacity(buffer, 10240, 0)
	VarSetCapacity(BytesRead, 4, 0)
	
	Loop
	{
		irf := DllCall("wininet\InternetReadFile", "UInt", iou, "UInt", &buffer, "UInt", 10240, "UInt", &BytesRead)
		VarSetCapacity(buffer, -1)
		BytesRead_ = 0
		
		Loop, 4
			BytesRead_ += *(&BytesRead + A_Index-1) << 8*(A_Index-1)
			If (irf = 1 and BytesRead_ = 0)
				break
			Else
				Result .= SubStr(buffer, 1, BytesRead_)
	}
	
	DllCall("wininet\InternetCloseHandle", "UInt", iou)
	DllCall("wininet\InternetCloseHandle", "UInt", io)
	DllCall("FreeLibrary", "UInt", hModule)
}

 
 GetFishPrice(fish, lbs){
	if(fish == "Bernfisch"){
		price := Floor(lbs * 1)
	}else if(fish == "Blauer Fächerfisch"){
		price := Floor(lbs * 2)
	}else if(fish == "Schwertfisch" || fish == "Zackenbarsch" || fish == "Roter Schnapper"){
		price := Floor(lbs * 3)
	}else if(fish == "Katzenfisch"){
		price := Floor(lbs * 4)
	}else if(fish == "Forelle"){
		price := Floor(lbs * 5)
	}else if(fish == "Delphin" || fish == "Hai" || fish == "Segelfisch"){
		price := Floor(lbs * 7)
	}else if(fish == "Makrele"){
		price := Floor(lbs * 8)
	}else if(fish == "Hecht" || fish == "Aal"){
		price := Floor(lbs * 9)
	}else if(fish == "Schildkröte"){
		price := Floor(lbs * 10)
	}else if(fish == "Thunfisch" || fish == "Wolfbarsch"){
		price := Floor(lbs * 12)
	}else{
		price := 0
	}
	return price
} 
 
 
gk_search(gk)
{
if(!RegExMatch(gk, "^\s*(\d+)\.(\d+)\s*$", regex_))
{
AddChatMessage("Deine Angabe ist ungültig")
return
}
URLDownloadToVar("http://samp.lennartf.com/gkapi/query/" regex_1 "/" regex_2 "", res)
if(!InStr(res, "success"))
{
AddChatMessage("Die vom Server erhaltenen Daten sind fehlerhaft. Versuche es (später) erneut")
return
}
AddChatMessage("{FFFFFF}Es wurden folgende Gebäudekomplexe unter {0077FF}" gk "{FFFFFF} gefunden:")
Loop, parse, res, `n
{
if(RegExMatch(A_LoopField, "^([^`t]*)`t([^`t]*)`t([^`t]*)`t([^`t]*)`t([^`t]*)", regex_))
{
if(regex_1 == "generic")
color := "{FF7F00}"
else if(regex_1 == "house")
color := "{77FF00}"
else if(regex_1 == "vehicle")
{
color := "{DD11FF}"
AddChatMessage("{FFFFFF}" A_Index-1 ". " color regex_2 "")
return
}
AddChatMessage("{FFFFFF}" A_Index-1 ". " color regex_2 " {FFFFFF}in " color regex_5)
}
}
} 



/* Folgt Später wenn es geht

#Include, C:\Users\Jakob\Desktop\Team\include\UDF.ahk
#Include, C:\Users\Jakob\Desktop\Team\include\API.ahk
#Include, C:\Users\Jakob\Desktop\Team\include\JSON.ahk
#Include, C:\Users\Jakob\Desktop\Team\include\overlay.ahk

global baseURL := "https://comniemeer.de/projects/teambinder/"
global botID := -1
global iRefreshTD := 0
global iUpdateTickTD := 100
global oTextDraws := []
SetTimer, annahmebot, 100


IfNotExist, %A_AppData%\Wheelman-Keybinder\
{
	FileCreateDir, %A_AppData%\Wheelman-Keybinder\Wheelman-Keybinder
	MsgBox, 48, Wheelman Keybinder, Der Keybinder erstellt nun dein Ordner , 5
}

IfNotExist, %A_AppData%\Wheelman-Keybinder\overlay.dll
{
	URLDownloadToFile, %baseURL%downloads/bin/overlay.dll, overlay.dll
	FileMove, overlay.dll, %A_AppData%\Wheelman-Keybinder\overlay.dll
}
		IfNotExist Tickets
	FileCreateDir, Tickets




overlayOn := false
aduty := false

Loop 15 {
	sup_text_%A_Index% := ""
	sup_name_%A_Index% := ""
}

numID := 1
page := 1

IniRead, primf, %A_AppData%\Wheelman-Keybinder\settings.ini, Settings, Primfarbe, 2550A7
IniRead, sekf, %A_AppData%\Wheelman-Keybinder\settings.ini, Settings, Sekfarbe, FF9E00
IniRead, overlayfs, %A_AppData%\Wheelman-Keybinder\settings.ini, Overlay, FarbeSelbst, FF8000
IniRead, overlayfa, %A_AppData%\Wheelman-Keybinder\settings.ini, Overlay, FarbeAndere, 0099FF
IniRead, adminrank, %A_AppData%\Wheelman-Keybinder\settings.ini, Settings, AdminRang, 1

IniRead, username, %A_AppData%\Wheelman-Keybinder\login.ini, Login, username, %A_Space%
IniRead, password, %A_AppData%\Wheelman-Keybinder\login.ini, Login, password, %A_Space%

global PRIMCOL := "{" . primf . "}"
global SECCOL := "{" . sekf . "}"

global PREFIX := PRIMCOL . "|Teambinder| {FFFFFF}"

global statsFormat := "Personalien:\tGeschlecht: (\S+)\n\t\tPartner: (\S+)\n\n\t\tLevel: (\d+)\n\t\tRespekt: (\d+)\/(\d+)\n\t\tPayday: (\d+)\/(\d+) Minuten\n\nBerufe:\t\tFraktion: (.+)\tRang: (\d+)\n\t\tNebenjob: (\S+)\n\t\tCrew: (.+)\n\nFinanzen:\tBargeld: (\d+)\$\n\t\tKonto: (\d+)\$\n\t\tFestgeld: (\d+)\$\tZinssatz: (\d+)\.(\d+)\n\nStatistik:\tMorde: (\d+)\n\t\tGestorben: (\d+)\n\t\tVerbrechen: (\d+)\n\t\tSpielzeit: (\d+)h\n\t\tKnast: (\d+)\n\t\tWanteds: (\d+)\n\t\tVerwarnungen: (\d+)\/(\d+)\n\nInventar:\tMaterialien: (\d+) \(Safe: (\d+)\)\n\t\tDrogen: (\d+)g \(Safe: (\d+)g\)\n\t\tHandy \(Nr\. (\d+)\)(\n\t\tErste-Hilfe-Paket)?(\n\t\tBenzin Kanister)?\n\nSkills:\t\tWaffendealer: (\d+) \((\d+)\)\n\t\tDrogendealer: (\d+) \((\d+)\)\n\t\tAngler: (\d+)\n\t\tBusfahrer: (\d+)\t\tExp: (\d+)\/(\d+)\n\t\tAnwalt: (\d+)\t\tExp: (\d+)\n\t\tDetektiv: (\d+)\t\tExp: (\d+)\n\t\tPilot: (\d+)\n\t\tHochseefischer: (\d+)(\n\n{(\S+)}(\S+)( \(noch (.+)\))?)?"

start := -1
hackerFinder := false

banwave := []
banwaveReason := ""

alternativePlayerInput := false

SetTimer, TicketTimer, 100
return


/*
VIP := 0

IfNotExist, VIP.ahk
{
	FileCreateDir, VIP.ahk

if(VIP == 1)
{
	;~ #Include VIP.ahk
}


MsgBox, 64, Nicht VIP, Nicht VIP
return






;~ if(Admin == 1)
;~ {
	user := GetUsername()
	if(user == Jakob)
	{
TicketTimer:
{
	IfWinNotActive, GTA:SA:MP
		return
	
	chat := readChatLine(0)
	
	if (chat == oldchat) {
		return
	} else {
		oldchat := chat
	}
	
	if (RegExMatch(chat, "\(\( Ticket (\d+) (\S+): (.*) \)\)", var)) {
		addStr(var1, var2, var3)
	} else if (RegExMatch(chat, "\.\.\.(.*) \)\)", var)) {
		chat_ := readChatLine(1)
		
		if (RegExMatch(chat_, "\(\( Ticket (\d+) (\S+): (.*)\.\.\.", var_)) {
			addStr(var_1, var_2, var_3)
			addStr(var_1, var_2, var1)
		}
	} else if (RegExMatch(chat, "Du hast das Ticket von (\S+) (.+).", var)) {
		if (var2 == "geschlossen") {
			saveTicket(var1)
		} else if (var2 == "zurückgelegt") {
			saveTicket(var1)
		}
	} else if (RegExMatch(chat, "(\S+) hat den Server verlassen. Das Ticket wurde geschlossen!", var)) {
		saveTicket(var1)
	} else if (RegExMatch(chat, "(\S+) wurde gekickt/gebannt. Das Ticket wurde geschlossen!", var)) {
		saveTicket(var1)
	} else if (RegExMatch(chat, "(\S+) hat ein Timeout. Das Ticket wurde geschlossen!", var)) {
		saveTicket(var1)
	}
}
return

saveTicket(name) {
	ticketID := 0
	
	if name is number
		ticketID := name
	else {
		Loop 15 {
			if (sup_name_%A_Index% == name) {
				ticketID := A_Index
				break
			}
		}
	}
	
	if (ticketID > 0) {
		IniRead, daytickets, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Ticketzähler, daytickets[%A_DD%:%A_MM%:%A_YYYY%]
		daytickets ++
		IniWrite, %daytickets%, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Ticketzähler, daytickets[%A_DD%:%A_MM%:%A_YYYY%]
		
		IniRead, gestickets, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Gesamt, gestickets, 0
		gestickets ++
		IniWrite, %gestickets%, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Gesamt, gestickets
		
		IniRead, monthtickets, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Monat, monthtickets[%A_MM%:%A_YYYY%]
		monthtickets ++
		IniWrite, %monthtickets%, %A_AppData%\Wheelman-Keybinder\Tickets.ini, Monat, monthtickets[%A_MM%:%A_YYYY%]
		
		str_speichern := RegExReplace(sup_text_%ticketID%, "{(\S{6})}")
		
		if (gestickets < 10) {
			str_ticketID := "0000" . gestickets
		} else if (gestickets < 100) {
			str_ticketID := "000" . gestickets
		} else if (gestickets < 1000) {
			str_ticketID := "00" . gestickets
		} else if (gestickets < 10000) {
			str_ticketID := "0" . gestickets
		} else {
			str_ticketID := gestickets
		}
		
		str_path := "Ticket #" . str_ticketID . " - " . sup_name_%ticketID% . " - " . A_DD . "." . A_MM . "." . A_YYYY . " " . A_Hour . "." . A_Min . "." . A_Sec . " Uhr.txt"
		
		FileAppend, %str_speichern%, %A_AppData%\Wheelman-Keybinder\Tickets\%str_path%
		
		AddChatMessage(PREFIX . "Du hast bereits " . SECCOL . gestickets . " {FFFFFF}Tickets bearbeitet. Heute: " . SECCOL . daytickets . " {FFFFFF}In diesem Monat: " . SECCOL . monthtickets)
		
		sup_text_%ticketID% := ""
		sup_zeilen_%ticketID% := 0
	}
}
return

addStr(id, name, inhalt) {
	global overlayfs
	global overlayfa
	
	StringReplace, inhalt, inhalt, ä, ae, All
	StringReplace, inhalt, inhalt, ö, oe, All
	StringReplace, inhalt, inhalt, ü, ue, All
	StringReplace, inhalt, inhalt, ß, ss, All
	
	if (name == getUsername()) {
		name := "**" . getUsername()
	} else {
		sup_name_%id% := name
		name := "{" . overlayfa . "}" . name
	}
	
	sup_text_%id% := sup_text_%id% . name . "{FFFFFF}: " . inhalt . "`n"
	
	global numID := id
	
	Loop, parse, sup_text_%numID%, `n, `r
	{
		index := A_Index
	}
	
	global page := Floor((index - 1) / 14) + 1
}
		
 ----------------------- ;
; Support-Overlay ;
; ----------------------- ;
:?:/supov::
{
	if (overlayOn) {
		SetTimer, updateOverlay, Off
		
		TextDestroy(sup_heading)
		TextDestroy(sup_page)
		TextDestroy(sup_text)
		BoxDestroy(sup_box)
		
		overlayOn := false
	} else {
		;~ sup_box := BoxCreate(500, 400, 275, 175, 0xDD000000, true)
		
		;~ BoxSetBorder(sup_box, 2, true)
		BoxSetBorderColor(sup_box, 0xFF5AE342)
		
		sup_heading := TextCreate("Arial", 7, true, false, 503, 403, 0xFF5AE342, "--- --- --- --- --- --- --- --- --- --- --- --- --- ---     Ticket #01     --- --- --- --- --- --- --- --- --- --- --- --- --- ---", false, false)
		sup_page := TextCreate("Arial", 7, true, false, 503, 560, 0xFF5AE342, "--- --- --- --- --- --- --- --- --- --- --- --- --- --- --    Seite 01   -- --- --- --- --- --- --- --- --- --- --- --- --- --- ---", false, false)
		
		sup_text := TextCreate("Arial", 7, true, false, 503, 413, 0xFFFFFFFF, "", false, false)
		
		TextSetShown(sup_heading, true)
		TextSetShown(sup_page, true)
		
		TextSetShown(sup_text, true)
		
		SetTimer, updateOverlay, 50
		
		overlayOn := true
	}
}
return

updateOverlay:
{
	IfWinNotActive, GTA:SA:MP
		return
	
	index := 0
	reading := false
	str := ""
	
	Loop, parse, sup_text_%numID%, `n, `r
	{
		if (page == 1) {
			reading := true
		} else if (A_Index == (page - 1) * 14 + 1) {
		;} else if (mod(A_Index, 15) == 0) {
			reading := true
		}
		
		if (reading) {
			index++
			str := str . A_LoopField . "`n"
			
			if (index == 14) {
				break
			}
		}
	}
	
	TextSetString(sup_text, str)
	
	if (numID < 10) {
		numStr := "0" . numID
	} else {
		numStr := numID
	}
	
	TextSetString(sup_heading, "--- --- --- --- --- --- --- --- --- --- --- --- --- ---     Ticket #" . numStr . "     --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
	
	if (page < 10) {
		zeileStr := "0" . page
	} else {
		zeileStr := page
	}
	
	TextSetString(sup_page, "--- --- --- --- --- --- --- --- --- --- --- --- --- --- --    Seite " . zeileStr . "  -- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
}
return

!Up::
{
	if (page == 1) {
		return
	}
	
	page--
}
return

!Down::
{
	page++
}
return

!Right::
{
	if (numID == 15) {
		numID := 1
	} else {
		numID++
	}
	
	Loop, parse, sup_text_%numID%, `n, `r
	{
		index := A_Index
	}
	
	page := Floor((index - 1) / 14) + 1
	
	if (page == 0) {
		page := 1
	}
}
return

!Left::
{
	if (numID == 1) {
		numID := 15
	} else {
		numID--
	}
	
	Loop, parse, sup_text_%numID%, `n, `r
	{
		index := A_Index
	}
	
	page := Floor((index - 1) / 14) + 1
	
	if (page == 0) {
		page := 1
	}
}
return

; ----------- ;
; Tickets ;
; ----------- ;
:?:/tt::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID = "")
		return
	
	acceptTicket(ticketID)
}
return

annahmebot:
Loop 15
{
    if(A_Index < 10)
        i := "0" . A_Index
    else
        i := A_Index
   
    textDraw := getTextDrawBySubstring("_~w~~h~" . i . ": ~y~")
    if(textDraw != "")
    {
        if(i == botID && InStr(textDraw, "~g~"))
        {
            botID := -1
        }
        else if(botID == -1)
        {
            botID := i
            ;~ AddChatMessage("Ticket " . COLOR_BLUE . "#" . i . COLOR_WHITE . " wurde erstellt. Drücke " . COLOR_BLUE . "'X'" . COLOR_WHITE . " um das Ticket anzunehmen!")
            SoundPlay, Piepton.mp3
        }
    }
    else if(botID == i)
        botID := -1
}
return
 
~x::
if(IsInChat())
    return
if(botID != -1)
{
    acceptTicket(botID)
}
return

Numpad1::
	acceptTicket(1)
return


Numpad2::
	acceptTicket(2)
return


Numpad3::
	acceptTicket(3)
return


Numpad4::
	acceptTicket(4)
return


Numpad5::
	acceptTicket(5)
return

Numpad6::
	acceptTicket(6)
return

Numpad7::
	acceptTicket(7)
return

Numpad8::
	acceptTicket(8)
return

Numpad9::
	acceptTicket(9)
return

acceptTicket(ticketID) {
	name := ""
	greeting := "Guten Tag"
	
	if (A_Hour >= 0 && A_Hour <= 10) {
		greeting := "Guten Morgen"
	} else if (A_Hour >= 11 && A_Hour <= 16) {
		greeting := "Guten Tag"
	} else if (A_Hour >= 17 && A_Hour <= 23) {
		greeting := "Guten Abend"
	} else {
		greeting := "Hallo"
	}
	
	SendChat("/tt " . ticketID)
	Sleep, 100
	a := readChatLine(0)
	
	if (RegExMatch(a, "Dieses Ticket wird bereits bearbeitet.") || RegExMatch(a, "Dieses Ticket wurde nicht erstellt.")) {
		return
	} else if (RegExMatch(a, "\(\( Ticket (\d+) (\S+): (.*) \)\)", var)) {
		name := var2
	} else if (RegExMatch(a, "\.\.\.(.*) \)\)", var)) {
		chat_ := readChatLine(1)
		
		if (RegExMatch(chat_, "\(\( Ticket (\d+) (\S+): (.*)\.\.\.", var_)) {
			name := var_2
		}
	}
	
	if (name != "") {
		greeting .= ", " . name
	}
	
	Sleep, 400
	SendChat("/aw " . ticketID . " " . greeting . "!")
	Sleep, 500
	SendChat("/aw " . ticketID . " Mein Name ist " . getUsername() . " und ich bin für deine Fragen oder Probleme offen!")
}

:?:/gt::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID == "")
		return
	
	reason := PlayerInput("Grund: ")
	
	if (reason == "")
		return
	
	toWhomInput := PlayerInput("An: ")
	
	if (toWhomInput == "")
		return
	
	if (InStr(toWhomInput, "Supporter") || InStr(toWhomInput, "Moderator") || InStr(toWhomInput, "Admin") || InStr(toWhomInput, "Head") || InStr(toWhomInput, "Projekt") || InStr(toWhomInput, "Community")) {
		toWhom := ""
		plus := "+"
		
		if (InStr(toWhomInput, "Projekt")) {
			toWhom := "Projektleiter"
			plus := ""
		} else if (InStr(toWhomInput, "Head")) {
			toWhom := "Head Admin"
		} else if (InStr(toWhomInput, "Admin")) {
			toWhom := "Admin"
		} else if (InStr(toWhomInput, "Moderator")) {
			toWhom := "Moderator"
		} else if (InStr(toWhomInput, "Supporter")) {
			toWhom := "Supporter"
		} else if (InStr(toWhomInput, "Community")) {
			toWhom := "Communityhelfer"
		} else {
			AddChatMessage(PREFIX . "Unbekannter Empfänger: " . SECCOL . toWhomInput)
			return
		}
		
		SendChat("/aw " . ticketID . " Ich werde dich nun an einen " . toWhom . plus . " weiterleiten.")
		Sleep, 500
		SendChat("/aw " . ticketID . " Bitte gedulde dich, bis ein " . toWhom . plus . " dein Ticket annimmt.")
		Sleep, 500
		
		toWhomCommand := toWhom
		command := "a"
		
		if (toWhomCommand == "Head Admin")
			toWhomCommand := "Head"
		
		if (toWhomCommand == "Communityhelfer")
			command := "com"
		
		SendChat("/gt " . ticketID . " " . toWhomCommand)
		Sleep, 250
		SendChat("/" . command . " [Ticket " . ticketID . "] Für: " . toWhom . plus . ", Grund: " . reason)
	} else {
		toWhom := getFullName(toWhomInput)
		
		if (toWhom == "") {
			AddChatMessage(PREFIX . "Unbekannter Spieler: " . SECCOL . toWhomInput)
		} else {
			SendChat("/aw " . ticketID . " Ich werde dich nun an " . toWhom . " weiterleiten.")
			Sleep, 500
			SendChat("/aw " . ticketID . " Bitte gedulde dich, bis " . toWhom . " dein Ticket annimmt.")
			Sleep, 500
			SendChat("/gt " . ticketID . " " . toWhom)
			Sleep, 250
			SendChat("/a [Ticket " . ticketID . "] Für: " . toWhom . ", Grund: " . reason)
		}
	}
}
return

:?:/dt::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID = "")
		return
	
	closeTicket(ticketID)
}
return

!Numpad1::
	closeTicket(1)
return

!Numpad2::
	closeTicket(2)
return

!Numpad3::
	closeTicket(3)
return

!Numpad4::
	closeTicket(4)
return

!Numpad5::
	closeTicket(5)
return

!Numpad6::
	closeTicket(6)
return

!Numpad7::
	closeTicket(7)
return

!Numpad8::
	closeTicket(8)
return

!Numpad9::
	closeTicket(9)
return

closeTicket(ticketID) {
	farewell := ""
	
	if ((A_WDay == 6 && A_Hour > 12) || A_WDay == 7 || (A_WDay == 1 && A_Hour < 12)) {
		farewell := " und ein schönes Wochenende"
	} else {
		if (A_Hour >= 0 && A_Hour <= 10) {
			farewell := " und einen angenehmen Morgen"
		} else if (A_Hour >= 11 && A_Hour <= 17) {
			farewell := " und einen schönen Tag"
		} else if (A_Hour >= 18 && A_Hour <= 23) {
			farewell := " und einen angenehmen Abend"
		}
	}
	
	SendChat("/aw " . ticketID . " Ich wünsche dir noch viel Spaß auf RPG-City" . farewell . ".")
	Sleep, 500
	SendChat("/aw " . ticketID . " Bei weiteren Fragen kannst du dich gerne wieder über das Ticketsystem melden.")
	Sleep, 500
	
	a := readChatLine(0)
	
	if (InStr(a, "Dieses Ticket wurde nicht erstellt.") || InStr(a, "Du bearbeitest dieses Ticket nicht."))
		return
	
	SendChat("/dt " . ticketID)
}

:?:/fragen::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		SendChat("/aw " . ticketID . " Hast du weitere Fragen, Probleme oder Anliegen?")
}
return

:?:/tafk::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID == "")
		return
	
	SendChat("/aw " . ticketID . " Da du nicht mehr antwortest, werde ich das Ticket nun schließen!")
	Sleep, 500
	closeTicket(ticketID)
}
return


:?:/wh::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		SendChat("/aw " . ticketID . " Wie kann ich dir helfen?")
}
return

:?:/grund::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		SendChat("/aw " . ticketID . " Warum soll ich dich an das gewünschte Mitglied weiterleiten?")
}
return

:?:/ubbw::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID == "")
		return
	
	SendChat("/aw " . ticketID . " UBB (= Neon) bzw. Unterbodenbeleuchtungs Codes kannst du in speziellen Events gewinnen (äußerst selten).")
	Sleep, 500
	SendChat("/aw " . ticketID . " Ebenfalls ist es möglich einen UBB-Code bzw. ein UBB-Car für InGame Geld von anderen Spielern abzukaufen.")
}
return

:?:/autow::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		SendChat("/aw " . ticketID . " Dein Auto findest du ganz einfach per /carkey -> Auto auswählen -> /findcar wieder.")
}
return

:?:/cop::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		SendChat("/aw " . ticketID . " Bitte melde dich beim zuständigen Beamten, die Administration hat damit nichts zu tun!")
}
return

:?:/close::
{
	ticketID := PlayerInput("Ticket-ID: ")
	
	if (ticketID != "")
		saveTicket(ticketID)
}
return


:?:/level::
{
	level := PlayerInput("Level: ")
	
	if (level == "")
		return
	
	if level is not number
		return
	
	chat := PlayerInput("Chat oder Ticket-ID: ")
	
	if (chat == "")
		chat := "l"
	
	if chat is number
		chat := "aw " . chat
	
	temp := (level - 1) * (level - 2) * 2 + (level - 1) * 8
	
	SendChat("/" . chat . " |---------------------------------------------|")
	SendChat("/" . chat . " Informationen zum Level " . FormatNumber(level) . ".")
	SendChat("/" . chat . " Spielstunden mit Premium: " . FormatNumber(Round(temp / 2, 0)) . ".")
	SendChat("/" . chat . " Spielstunden ohne Premium: " . FormatNumber(temp) . ".")
	SendChat("/" . chat . " Benötigte Respektpunkte zum nächsten Level: " . FormatNumber(8 + (level - 1) * 4) . ".")
	SendChat("/" . chat . " |---------------------------------------------|")
}
return

:?:/fraktionen::
{
	sleep, 200
	fraktionen =
		(LTrim
			{ff0000}______________ Staatsfraktionen ______________{ffffff}
			
			{ffff00}1  {ffffff}- Los Santos Police Department
			{ffff00}2  {ffffff}- Federal Bureau of Investigation
			{ffff00}3  {ffffff}- Las Venturas Police Department
			{ffff00}4  {ffffff}- Los Santos Medical Department
			{ffff00}19 {ffffff}- San Andreas Fire Department
			{ffff00}7  {ffffff}- Regierung
			{ffff00}9  {ffffff}- San News
			{ffff00}13 {ffffff}- Ordnungsamt
			{ffff00}14 {ffffff}- Transport GmbH
			
			{402eb4}______________ Gangs & Mafien ______________{ffffff}
			
			{ffff00}5  {ffffff}- Russen Mafia
			{ffff00}6  {ffffff}- Yakuza
			{ffff00}8  {ffffff}- Hitman
			{ffff00}18 {ffffff}- Wheelman
			{ffff00}10 {ffffff}- Grove Street
			{ffff00}11 {ffffff}- Ballas
			{ffff00}12 {ffffff}- Los Chickos Malos
			{ffff00}15 {ffffff}- San Fierro Rifa
			{ffff00}16 {ffffff}- Los Santos Vagos ({ff0000}Entfernt{ffffff})
			{ffff00}17 {ffffff}- Triaden
		)
	
	ShowDialog(0, "Fraktionen ID's", fraktionen, "OK")
}
return

:?:/jobs::
{
	sleep, 200
	jobs =
		(LTrim
			{30db20}____________ Job Hilfe-ID's ____________
			
			{ffff00}1  {ffffff}- Detektiv - Help 29
			{ffff00}2  {ffffff}- Pizzaboy ({ff0000}Entfernt{ffffff})
			{ffff00}3  {ffffff}- Hochseefischer - Help 30
			{ffff00}4  {ffffff}- Drogendealer ({ff0000}kein Job mehr{ffffff}) - Help 31
			{ffff00}9  {ffffff}- Waffendealer ({ff0000}kein Job mehr{ffffff}) - Help 32
			{ffff00}14 {ffffff}- Müllmann - Help 34
			{ffff00}15 {ffffff}- Taxi ({ff0000}Entfernt{ffffff})
			{ffff00}16 {ffffff}- Trucker - Help 35
			{ffff00}18 {ffffff}- Zugfahrer - Help 33
			{ffff00}19 {ffffff}- Pilot - Help 36
			{ffff00}22 {ffffff}- KFZ-Mechaniker ({ff0000}Entfernt{ffffff}) - Help 37
			{ffff00}25 {ffffff}- Anwalt - Help 38
			{ffff00}30 {ffffff}- Busfahrer - Help 39
		)
	
	ShowDialog(0, "Job Hilfe-ID's", jobs, "OK")
}
return



:?:/carinfos::
{
	car := PlayerInput("Fahrzeug: ")
	carResult := UrlDownloadToVar("https://comniemeer.de/cars/api.php?carinfo=" . car)
	
	if (carResult == "ERROR_CONNECTION") {
		AddChatMessage(PREFIX . "Fehler bei der Verbindung zum Server!")
		return
	}
	
	carStats := JSON.Load(carResult)
	
	if (carStats.Length() == 0) {
		AddChatMessage(PREFIX . "Keine Ergebnisse zur Suche nach dem Fahrzeug " . SECCOL . car . "{FFFFFF}.")
	} else if (carStats.Length() > 1) {
		AddChatMessage(PREFIX . "Mehr als 1 Ergebnis bei der Suche nach dem Fahrzeug " . SECCOL . car . "{FFFFFF}.")
	} else {
		autohaus := carStats[1][1]
		name := carStats[1][2]
		preis := carStats[1][3]
		verbrauch := carStats[1][4]
		tank := carStats[1][5]
		mindestlevel := carStats[1][6]
		geschwindigkeit := carStats[1][7]
		tuningwerkstatt := carStats[1][8]
		modelid := carStats[1][9]
		
		AddChatMessage(PREFIX . "Allgemeine Infos: " . SECCOL . "1 {FFFFFF}- Tuningwerkstatt: " . SECCOL . "2")
		
		info := PlayerInput("Info: ")
		
		if (info == "")
			return
		
		chat := PlayerInput("Chat oder Ticket-ID: ")
		
		if (chat == "")
			chat := "l"
		
		if chat is number
			chat := "aw " . chat
		
		if (info == "1") {
			SendChat("/" . chat . " Fahrzeug: " . name . ", Autohaus: " . autohaus . ", Preis: " . FormatNumber(preis) . "$, Geschwindigkeit: " . geschwindigkeit . " km/h")
		} else if (info == "2") {
			SendChat("/" . chat . " Das Fahrzeug '" . name . "' kannst du in der Tuningwerkstatt '" . tuningwerkstatt . "' tunen.")
			SendChat("/" . chat . " Die Werkstatt findest du im '/gps' => 'Sonstiges' => '" . tuningwerkstatt . "'")
		}
	}
}
return

:?:/astats::
{
	IniRead, gestickets, Tickets.ini, Gesamt, gestickets
	IniRead, monthtickets, Tickets.ini, Monat, monthtickets[%A_MM%:%A_YYYY%]
	IniRead, daytickets, Tickets.ini, Ticketzähler, daytickets[%A_DD%:%A_MM%:%A_YYYY%]
	
	Sleep, 100
	
	ShowDialog(0, "Ticketstatistik", "{FFFFFF}------------------------------------------`nTickets insgesamt: " . SECCOL . gestickets . "{FFFFFF}`n------------------------------------------`nTickets diesen Monat: " . SECCOL . monthtickets . "{FFFFFF}`n------------------------------------------`nTickets heute: " . SECCOL . daytickets . "{FFFFFF}`n------------------------------------------", "OK")
}
return



updateTextDraws() {
    if (!checkHandles())
        return 0
    if (iRefreshTD + iUpdateTickTD > A_TickCount)
        return 1
    oTextDraws := []
    iRefreshTD := A_TickCount
    dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0F8)
    if (ErrorLevel || !dwAddress) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + 0x3CD)
    if (ErrorLevel || !dwAddress) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwTextDraw := readDWORD(hGTA, dwAddress + 0x10)
    if (ErrorLevel || !dwTextDraw) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    Loop, % 2048
    {
        i := A_Index - 1
       
        dwIsActive := readDWORD(hGTA, dwTextDraw + i * 4)
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if (!dwIsActive)
            continue
        dwAddr := readDWORD(hGTA, dwTextDraw + i * 4 + (4 * (256 + 2048)))
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if (!dwAddr)
            continue
        sText := readString(hGTA, dwAddr, 800)
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
       
        oTextDraws[i] := sText
    }
    ErrorLevel := ERROR_OK
    return 1
}
 
getTextDrawBySubstring(substring) {
    if(!updateTextDraws())
        return
    For i, o in oTextDraws
    {
        if(!InStr(o, substring))
            continue
        return o
    }
}
}
/*