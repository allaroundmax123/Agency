#Include API.ahk
#ifWinActive, GTA:SA:MP
#SingleInstance, force
#Persistent
#UseHook
#NoEnv


ifExist, updater.exe
        FileDelete, updater.exe
		
IfNotExist, background.png
	URLDownloadToFile, http://hitman.jameschans.de/keybinder/background.png, background.png

keybinderVersion := 1.3
global username := GetUsername()

if(username == "")
{
RegRead, username, HKCU, Software\SAMP, PlayerName
}
url = http://hitman.jameschans.de/keybinder/check.php?name=%username%
UrlDownloadtoVar(url, result)
result = 1
if(result == "ERR_WRONG_ACCOUNT" || result == "ERR_VARIABLE_EMPTY" || result == "ERR_VARIABLE_EMPTY")
{
	MsgBox, 16, Fehler, Du stehst nicht auf der Whitelist`, bitte kontaktiere die Leaderschaft, 4
	ExitApp
} else {
	VarSetCapacity(url, -1)
	VarSetCapacity(result, -1)
}


urli = http://hitman.jameschans.de/keybinder/versionhitman.txt
URLDownloadToVar(urli, result_)
if(result_ > keybinderVersion)
{
        MsgBox, 68, Update verfügbar, Lieber Benutzer,`nes ist ein neues Update für den Keybinder verfügbar ( Version %result_% ).`nMöchtest Du nun updaten?
        IfMsgBox, Yes
        {
                MsgBox, 68, Update wird heruntergeladen!, Das Update wird nun heruntergeladen, 3
                URLDownloadToFile, http://hitman.jameschans.de/keybinder/updaterhitman.exe, updater.exe
                MsgBox, 68, Updater start, Der Updater wird nun gestartet und der Keybinder geschlossen., 3
                run, updater.exe
                ExitApp
        }
}

SetTimer, Timer, 1000
SetTimer, XTaste, 500
SetTimer, antiSpam, On
Settimer, contracts, 1000




;{
IniRead, Profil1_1, settings.ini, Ausruesten, Profil1_1
IniRead, Profil1_2, settings.ini, Ausruesten, Profil1_2
IniRead, Profil1_3, settings.ini, Ausruesten, Profil1_3
IniRead, Profil1_4, settings.ini, Ausruesten, Profil1_4
IniRead, Profil1_5, settings.ini, Ausruesten, Profil1_5
IniRead, Profil1_6, settings.ini, Ausruesten, Profil1_6
IniRead, Profil1_7, settings.ini, Ausruesten, Profil1_7
;V2
IniRead, Profil2_1, settings.ini, Ausruesten, Profil2_1
IniRead, Profil2_2, settings.ini, Ausruesten, Profil2_2
IniRead, Profil2_3, settings.ini, Ausruesten, Profil2_3
IniRead, Profil2_4, settings.ini, Ausruesten, Profil2_4
IniRead, Profil2_5, settings.ini, Ausruesten, Profil2_5
IniRead, Profil2_6, settings.ini, Ausruesten, Profil2_6
IniRead, Profil2_7, settings.ini, Ausruesten, Profil2_7
;Einstellung
IniRead, Orgcall, settings.ini, Einstellung, Orgcall
IniRead, Erstehilfe, settings.ini, Einstellung, Erstehilfe
IniRead, Drugs, settings.ini, Einstellung, Drugs
IniRead, Fische, settings.ini, Einstellung, Fische
IniRead, AktvierenHP, settings.ini, Einstellung, AktvierenHP
IniRead, PaketUse, settings.ini, Einstellung, PaketUse
IniRead, DrugsUse, settings.ini, Einstellung, DrugsUse
IniRead, FishUse, settings.ini, Einstellung, FishUse
IniRead, AutoMotorAus, settings.ini, Einstellung, AutoMotorAus, 0
IniRead, angelType, settings.ini, Einstellung, angelType, 3
IniRead, Alock, settings.ini, Einstellung, Alock, 1
InIRead, ALight, settings.ini, Einstellung, ALight, 1
IniRead, coplist, settings.ini, Einstellung, Copliste, 2
IniRead, fg, settings.ini, Einstellung, Festgeld, 1250000


;Werbung
IniRead, Werbung, settings.ini, AD, Werbung, /contract
;}
fischers := 1

Slashbinds=
(
FISH
============================================================================================================
/fish `t`t`t-`t`t Fischt 5x 
/afish `t`t`t-`t`t Fischt 5x 
/FischHP`t`t-`t`t Sellt Ingame auf Low Hp fisch ein 
/FischGeld`t`t`t-`t`tSellt Ingame auf billigsten fisch ein
/vrk `t`t`t-`t`t Verkauft alle 5 Fische 
/fische `t`t`t-`t`t Zeigt die gefangen fische an
/kochen `t`t`t-`t`t Kocht 1-5
/HP`t`t`t-`t`tzeigt die Hp der Fische an
============================================================================================================


SMS
============================================================================================================
/ksms `t`t`t-`t`t Sms by Name
/re`t`t`t-`t`t antwort auf die letzt sms
============================================================================================================

Handy
============================================================================================================
/p `t`t`t-`t`t Telefonat annehmen
/ab`t`t`t-`t`t Anrufbeantwort
/h `t`t`t-`t`t Auflegen
============================================================================================================

Umrechner
============================================================================================================
/ftime`t`t`t-`t`tSchreibt im /f wie lange man noch sitzt
/cd`t`t`t-`t`tCountdown 5-1
/min`t`t`t-`t`trechnet sec in min
/tr`t`t`t-`t`tTaschenrechner mit +-*/
============================================================================================================


Sonstiges
============================================================================================================
/db`t`t`t-`t`tDrink bier 2x
/alotto`t`t`t-`t`tRandom Zahl bei lotto
/aall`t`t`t-`t`tAusruesten All
/ac`t`t`t-`t`tAcceptet so gut wie alles
/ap`t`t`t-`t`tAccept Paket
/pb`t`t`t-`t`t/paintball
/cc`t`t`t-`t`tPrivater Chatclear
/chatclear`t`t`t-`t`tPrivater Chatclear
/af`t`t`t-`t`t Findet Autom. den Gesuchten Spieler
/as`t`t`t-`t`t Zeigt Autom. den Gesuchten Spieler
/fg`t`t`t-`t`t Legt Festgeld ein
/oc`t`t`t-`t`t /offlinecontract
/dc`t`t`t-`t`t /deathcontract
/sad`t`t`t-`t`t Führt die Eingene AD aus
/gk`t`t`t-`t`t manuelle GK Abfrage
============================================================================================================


TASTEN
============================================================================================================
Pause`t`t`t-`t`tPausiert den Keybinder
X`t`t`t-`t`tÖffnet zoll/tankt das fahrzeug
#`t`t`t-`t`tFührt das Kidnapsystem aus
============================================================================================================


COPLISTE
============================================================================================================
/cops`t`t`t-`t`tZeigt alle Cops an die gerade Online sind
/delcop`t`t`t-`t`tEntfernt einen Cop.
/addcop `t`t`t-`t`tFügt einen Cop hinzu
)

;{ ======= Inilesen
Loop, 30
{
	IniRead, CMD%A_Index%, Hotkeys.ini, Command, CMD%A_Index%, %A_Space%
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	
	if(HK%A_Index% != "Keine")
        Hotkey, % HK%A_Index%, HotKey%A_Index%, On
} ; Oben ins Script



 
 Gui, Destroy
 Gui, Add, Picture, x-8 y-31 w910 h580 +BackGroundTrans, %A_ScriptDir%\background.png
; Gui, Tab, Start

Loop, 30
{
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	StringReplace, HK%A_Index%, HK%A_Index%, ~,,
}

; = Spalte 1
y := 39
Loop, 10
{
	Gui, Add, Hotkey, x25 y%y% w90 h20 vHK%A_Index% gLabel, % HK%A_Index%
	y += 40
}
;}

;{
Gui, Add, text, x132 y39 +BackGroundTrans cwhite, Motor An/Aus
Gui, Add, text, x132 y80 +BackGroundTrans cwhite, Fahrzeug Abschließen
Gui, Add, text, x132 y120 +BackGroundTrans cwhite, Members
Gui, Add, text, x132 y160 +BackGroundTrans cwhite, Crewmembers
Gui, Add, text, x132 y200 +BackGroundTrans cwhite, Fisch Essen (1-5)
Gui, Add, text, x132 y240 +BackGroundTrans cwhite, usedrugs 
Gui, Add, text, x132 y280 +BackGroundTrans cwhite, Erstehilfe 
Gui, Add, text, x132 y320 +BackGroundTrans cwhite, Call Backup
Gui, Add, text, x132 y360 +BackGroundTrans cwhite, Cancel Backup
Gui, Add, text, x132 y400 +BackGroundTrans cwhite, Help Backup

; == Spalte 2
y := 39
cmdcount := 11
Loop, 10
{
	Gui, Add, Hotkey, x312 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	y += 40
	cmdcount++
}
Gui, Add, text, x422 y39 +BackGroundTrans cwhite, Position Im F-Chat
Gui, Add, text, x422 y80 +BackGroundTrans cwhite, Position im Org-Chat
Gui, Add, text, x422 y120 +BackGroundTrans cwhite, Letzten Befehl Wiederholen
Gui, Add, text, x422 y160 +BackGroundTrans cwhite, Auto. Findystem Deaktiveren
Gui, Add, text, x422 y200 +BackGroundTrans cwhite, Maske verwenden
Gui, Add, text, x422 y240 +BackGroundTrans cwhite, /oldcontracts
Gui, Add, text, x422 y280 +BackGroundTrans cwhite, /hram
Gui, Add, text, x422 y320 +BackGroundTrans cwhite, Contractmodus ( siehe Hilfe )
Gui, Add, text, x422 y360 +BackGroundTrans cwhite, Ausruesten(V1)
Gui, Add, text, x422 y400 +BackGroundTrans cwhite, Ausruesten(V2)
Gui, Add, Text, x705 y5 +BackGroundTrans cwhite, © 2017 by John_Reese

; == Spalte 3
y := 39

cmdcount := 21
Loop, 10
{ 
	Gui, Add, Hotkey, x592 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	Gui, Add, edit, x702 y%y% w90 h20 vCMD%cmdcount%, % CMD%cmdcount%
	y += 40
	cmdcount++
}




;Gui, add, Text, x712 y119, Verfügbare Labels:`n`n[HP] => Gibt die HP aus`n`n[Land] => Gibt das Land aus`n`n[Stadt] => Gibt die Stadt aus`n`n[Veh] => Gibt den Fahrzeugname aus`n`n[VehHP] => Gibt die Fahrzeughp aus`n`n[Kill] => Gibt die aktuellen Kills aus`n`n[Death] => Gibt die aktuellen Tode aus`n`n[KD] => Gibt die KD aus`n`n[HEAL] => Healt sich bei <100 HP`n`n[MOTOR] => Motorsystem

Gui, Add, text, x10 y5 +BackgroundTrans cwhite, Belegbare Hotkeys
Gui, Add, Groupbox, x10 y15 w810 h495  +BackGroundTrans cwhite,


;Unten
Gui, Add, Button, x20 y459 w90 h40 gSad +BackGroundTrans cwhite, Eigene Werbung  
Gui, Add, Button, x120 y459 w90 h40 gAusruesten +BackGroundTrans cwhite, Ausruesten
Gui, Add, Button, x220 y459 w90 h40 gEbinds +BackGroundTrans cwhite, Variablen
Gui, Add, Button, x320 y459 w90 h40 gEinstellungen +BackGroundTrans cwhite, Einstellungen
Gui, Add, Button, x420 y459 w90 h40 gFest, Keybinds 
Gui, Add, Button, x520 y459 w90 h40 gBTdynHotSave, Speichern
Gui, Add, Button, x620 y459 w90 h40 ghelp +BackGroundTrans cwhite, Hilfe
Gui, Add, Button, x720 y459 w90 h40 gconnect +BackGroundTrans cwhite, Direct Connect

Gui, Show, w830 h525, Hitman Keybinder V %keybinderVersion%
return
;}

connect:
RegRead GTA_SA_EXE, HKEY_CURRENT_USER, Software\SAMP, GTA_SA_EXE 
SplitPath, GTA_SA_EXE,, PFAD 
Run, %PFAD%\samp.exe server.rpg-city.de:7777
return


help:
Gui, 7:Add, Picture, x-118 y-21 w1640 h850 , %A_ScriptDir%\background.png
Gui, 7:Add, Button, x12 y389 w100 h30 gZurückstart, Zurück
Gui, 7:Add, GroupBox, x12 y29 w520 h350 +BackgroundTrans, 
Gui, 7:Font, S8 CWhite, Verdana
Gui, 7:Add, Text, x12 y19 w100 h20 +BackgroundTrans, Keybinder Hilfe
Gui, 7:Add, Text, x22 y39 w500 h330 +BackgroundTrans, Contractmodus:`nIn dem Contractmodus kannst Du den Spieler auswählen`, sollte er Offlineflucht/Getötet werden und der CT wurde nicht ausgeführt`, so kannst Du`nerneut diese Taste drücken`, damit er`nentweder den Offline CT erhält oder den Death CT
Gui, 7:Show, w541 h437, Keybinderhilfe
return


Sad:

;Gui, 2: New
Gui, 2: Add, Picture, x0 y0 w450 h250 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 2: Add, Edit, x30 y137 w250 h20 vWerbung, %Werbung%
Gui, 2: Add, Button, x285 y133 w60 h25 gSpeichern_AD, Speichern
Gui, 2: Add, GroupBox, x12 y9 w337 h170 +BackgroundTrans,
Gui, 2: Add, Text, x15 y3 cwhite +BackgroundTrans, Eigene advertising
Gui, 2: Add, Text, x36 y40 w300 h80  +BackGroundTrans cwhite, Herzlich Willkommen bei deinem individuelles advertising-Profil.`nHier kannst du dein Persönliche Werbung erstellen mit deiner Eigener Variation. Füge in das Fenster deine eigene Werbung ein wie du sie haben Möchtest`n`nz.B. /contract ID 5000 `n`nDas /ad brauchst Du nicht

Gui, 2: Show, w361 h216, Eigene AD
return


Speichern_AD:
;ADSpeichern
GuiControlGet, Werbung
IniWrite, %Werbung%, settings.ini, AD, Werbung
IniRead, Werbung, settings.ini, AD, Werbung
Reload
return



Ausruesten:
;{~ Gui 3: New
Gui, 3: Add, Picture, x0 y0 w900 h300 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 3: Add, Text, x22 y29 w910 h70 +BackgroundTrans cwhite, Herzlich Willkommen bei deinem individuelles Ausrüst-Profil.`nHier kannst du dein Persönliches Ausrüst Profil erstellen mit deinen Eigener Variation für das Ausruesten.`nDu kannnst auch deine Eigene Taste auswählen mit der du dich ausrüsten möchtest. `nWICHTIG: Der erste Waffenslot darf nicht leer sein | Die Hotkeys für das AusrüstProf, kannst Du auf der Startseite Festlegen.
Gui, 3: Add, GroupBox, x12 y9 w800 h75 , 
Gui, 3: Add, GroupBox, x12 y108 w800 h153 ,
Gui, 3: Add, Text, x12 y102 +BackgroundTrans cwhite, Information
Gui, 3: Add, Text, x12 y3 +BackgroundTrans cwhite, Ausruesten
Gui, 3: Add, DropDownList, x22 y137 w90 h110 vProfil1_1, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x122 y137 w90 h110 vProfil1_2, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x222 y137 w90 h110 vProfil1_3, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x322 y137 w90 h110 vProfil1_4, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x422 y137 w90 h110 vProfil1_5, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x522 y137 w90 h110 vProfil1_6, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x622 y137 w90 h110 vProfil1_7, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
;V2
Gui, 3: Add, DropDownList, x22 y172 w90 h110 vProfil2_1, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x122 y172 w90 h110 vProfil2_2, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x222 y172 w90 h110 vProfil2_3, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x322 y172 w90 h110 vProfil2_4, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x422 y172 w90 h110 vProfil2_5, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x522 y172 w90 h110 vProfil2_6, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper
Gui, 3: Add, DropDownList, x622 y172 w90 h110 vProfil2_7, ||Messer|Deagle|Shotgun|MP5|M4|Drogen|Sniper

GuiControl, 3: Choose, Profil1_1, %Profil1_1%
GuiControl, 3: Choose, Profil1_2, %Profil1_2%
GuiControl, 3: Choose, Profil1_3, %Profil1_3%
GuiControl, 3: Choose, Profil1_4, %Profil1_4%
GuiControl, 3: Choose, Profil1_5, %Profil1_5%
GuiControl, 3: Choose, Profil1_6, %Profil1_6%
GuiControl, 3: Choose, Profil1_7, %Profil1_7%


GuiControl, 3: Choose, Profil2_1, %Profil2_1%
GuiControl, 3: Choose, Profil2_2, %Profil2_2%
GuiControl, 3: Choose, Profil2_3, %Profil2_3%
GuiControl, 3: Choose, Profil2_4, %Profil2_4%
GuiControl, 3: Choose, Profil2_5, %Profil2_5%
GuiControl, 3: Choose, Profil2_6, %Profil2_6%
GuiControl, 3: Choose, Profil2_7, %Profil2_7%

Gui, 3: Add, Button, x78 y205 w120 h40 gSpeichern_Ausruesten, Speichern

Gui, 3: Show, w822 h273, Ausrüsten
return



Speichern_Ausruesten:
GuiControlGet, Profil1_1
GuiControlGet, Profil1_2
GuiControlGet, Profil1_3
GuiControlGet, Profil1_4
GuiControlGet, Profil1_5
GuiControlGet, Profil1_6
GuiControlGet, Profil1_7

 
GuiControlGet, Profil2_1
GuiControlGet, Profil2_2
GuiControlGet, Profil2_3
GuiControlGet, Profil2_4
GuiControlGet, Profil2_5
GuiControlGet, Profil2_6
GuiControlGet, Profil2_7

 

IniWrite, %Profil1_1%, settings.ini, Ausruesten, Profil1_1
IniWrite, %Profil1_2%, settings.ini, Ausruesten, Profil1_2
IniWrite, %Profil1_3%, settings.ini, Ausruesten, Profil1_3
IniWrite, %Profil1_4%, settings.ini, Ausruesten, Profil1_4
IniWrite, %Profil1_5%, settings.ini, Ausruesten, Profil1_5
IniWrite, %Profil1_6%, settings.ini, Ausruesten, Profil1_6
IniWrite, %Profil1_7%, settings.ini, Ausruesten, Profil1_7


IniWrite, %Profil2_1%, settings.ini, Ausruesten, Profil2_1
IniWrite, %Profil2_2%, settings.ini, Ausruesten, Profil2_2
IniWrite, %Profil2_3%, settings.ini, Ausruesten, Profil2_3
IniWrite, %Profil2_4%, settings.ini, Ausruesten, Profil2_4
IniWrite, %Profil2_5%, settings.ini, Ausruesten, Profil2_5
IniWrite, %Profil2_6%, settings.ini, Ausruesten, Profil2_6
IniWrite, %Profil2_7%, settings.ini, Ausruesten, Profil2_7

 
IniRead, Profil1_1, settings.ini, Ausruesten, Profil1_1
IniRead, Profil1_2, settings.ini, Ausruesten, Profil1_2
IniRead, Profil1_3, settings.ini, Ausruesten, Profil1_3
IniRead, Profil1_4, settings.ini, Ausruesten, Profil1_4
IniRead, Profil1_5, settings.ini, Ausruesten, Profil1_5
IniRead, Profil1_6, settings.ini, Ausruesten, Profil1_6
IniRead, Profil1_7, settings.ini, Ausruesten, Profil1_7

IniRead, Profil2_1, settings.ini, Ausruesten, Profil2_1
IniRead, Profil2_2, settings.ini, Ausruesten, Profil2_2
IniRead, Profil2_3, settings.ini, Ausruesten, Profil2_3
IniRead, Profil2_4, settings.ini, Ausruesten, Profil2_4
IniRead, Profil2_5, settings.ini, Ausruesten, Profil2_5
IniRead, Profil2_6, settings.ini, Ausruesten, Profil2_6
IniRead, Profil2_7, settings.ini, Ausruesten, Profil2_7


Reload
return

;}

EBinds:
Gui, 4:Add, Picture, x0 y0 w460 h290 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 4: add, Text, x27 y29 +BackgroundTrans cwhite, Verfügbare Labels:`n`n[HP] => Gibt die HP aus`n`n[Land] => Gibt das Land aus`n`n[Stadt] => Gibt die Stadt aus`n`n[Veh] => Gibt den Fahrzeugname aus`n`n[VehHP] => Gibt die Fahrzeughp aus`n`n
Gui, 4: add, Text, x227 y29 +BackgroundTrans cwhite,  `n`n[Kill] => Gibt die aktuellen Kills aus`n`n[Death] => Gibt die aktuellen Tode aus`n`n[KD] => Gibt die KD aus`n`n[HEAL] => Healt sich bei <100 HP`n`n[MOTOR] => Motorsystem
Gui, 4: Add, Button, x12 y217 w100 h40 gZurückstart, Zurück
Gui, 4: Add, GroupBox, x12 y9 w403 h200 +BackgroundTrans cwhite,
Gui, 4: add, text, x12 y4 +BackgroundTrans cwhite, Variablen

Gui, 4: Show, Center  h268 w427, Hitman Keybinder
return

Einstellungen:
;{
Gui, 5:Add, Picture, x0 y0 w780 h550 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 5: Add, GroupBox, x12 y9 w360 h295 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x13 y2 +BackgroundTrans cwhite, de/aktivieren
Gui, 5: Add, CheckBox, x20 y25 w12 h12 +BackgroundTrans cwhite vOrgcall Checked%Orgcall%,
Gui, 5: Add, Text, x35 y25 +BackgroundTrans cwhite, Meldet den Backup-call auch im /crew-chat?
Gui, 5: Add, Checkbox, x20 y50 w12 h12 +BackgroundTrans cwhite vStats Checked%Stats% ,
Gui, 5: Add, Text, x35 y50 +BackgroundTrans cwhite, Stellt ein ob die Stats bearbeitet werden?
Gui, 5: Add, Checkbox, x20 y75 w12 h12 +BackgroundTrans cwhite vAktvierenHP Checked%AktvierenHP% ,
Gui, 5: Add, Text, x35 y75 +BackgroundTrans cwhite, Die HP selbst einstellen, wann er Paket/Fische/Drogen used?
Gui, 5: Add, Checkbox, x20 y200 w12 h12 +BackgroundTrans cwhite vAutoMotorAus Checked%AutoMotorAus% ,
Gui, 5: add, Text, x35 y200 +BackgroundTrans cwhite, beim Absteigen den Motor ausschalten?
Gui, 5: Add, Checkbox, x20 y250 w12 h12 +BackgroundTrans cwhite  vAlock Checked%Alock%,
Gui, 5: Add, Text, x35 y250 +BackgroundTrans cwhite, Fahrzeug abschließen beim Motorstart
Gui, 5: add, Checkbox, x20 y275 w12 h12 +BackgroundTrans cwhite vALight Checked%ALight%,
Gui, 5: Add, Text, x35 y275 +BackgroundTrans cwhite, Fahrzeuglicht einschalten bei Motorstart

;Fisch
Gui, 5: Add, GroupBox, x385 y200 w300 h100 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x385 y190 +BackgroundTrans cwhite, Einstellung /Fish
Gui, 5: Add, Text, x400 y225 +BackgroundTrans cwhite, Willst du den Billigsten Fisch, den HP niedrigsten Fisch oder
Gui, 5: Add, Text, x400 y240 +BackgroundTrans cwhite,  keinen Fisch wegschmeißen?
Gui, 5: Add, Text, x400 y255 +BackgroundTrans cwhite, HP = 1 || $ = 2 || Nix = 3
Gui, 5: Add, Edit, x520 y254 w50 h16 vangelType, %angelType%

;Copliste
Gui, 5: Add, GroupBox, x385 y320 w300 h100 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x385 y310 +BackgroundTrans cwhite, Einstellung /cops
Gui, 5: Add, Text, x400 y335 +BackgroundTrans cwhite, Willst Du die Copliste als Dialog oder im Chat?
Gui, 5: Add, Text, x400 y365 +BackgroundTrans cwhite, Dialog = 1 || Chat = 2
Gui, 5: Add, Edit, x520 y364 w50 h16 vcoplist, %coplist%

;Festgeld
Gui, 5: Add, Groupbox, x12 y300 w200 h80 +BackgroundTrans cwhite
Gui, 5: Add, Text, x15 y310 +BackgroundTrans cwhite, Festgeld
Gui, 5: Add, Edit, x15 y330 w100 h20 vfg, %fg%

	
	
If(AktvierenHP == 1)
{
Gui, 5: Add, Groupbox, x385 y9 w200 h115 +BackgroundTrans, 
Gui, 5: Add, Text, x386 y2 +BackgroundTrans cwhite, Einstellung HP 
Gui, 5: Add, Edit, x400 y35 w30 h20 vPaketUse, %PaketUse%
Gui, 5: Add, Edit, x400 y60 w30 h20 vDrugsUse, %DrugsUse%
Gui, 5: Add, Edit, x400 y85 w30 h20 vFishUse, %FishUse%
Gui, 5: Add, Text, x432 y37 +BackgroundTrans cwhite, HP`tErstehilfe Paket
Gui, 5: Add, Text, x432 y62 +BackgroundTrans cwhite, HP`tDrogen
Gui, 5: Add, Text, x432 y87 +BackgroundTrans cwhite, HP`tFische
Gui, 5: Add, Checkbox, x20 y125 w12 h12 +BackgroundTrans cwhite vErstehilfe Checked%Erstehilfe%,
Gui, 5: Add, Text, x35 y125 +BackgroundTrans cwhite, Paket erst ab einer speziellen HP usebar.
Gui, 5: Add, Checkbox, x20 y150 w12 h12 +BackgroundTrans cwhite vDrugs Checked%Drugs% , 
Gui, 5: Add, Text, x35 y150 +BackgroundTrans cwhite, Drogen erst ab einer speziellen HP usebar.
Gui, 5: Add, Checkbox, x20 y175 w12 h12 +BackgroundTrans cwhite vFische Checked%Fische% , Fische erst ab einer speziellen HP usebar.
Gui, 5: Add, Text, x35 y175 +BackgroundTrans cwhite, Fische erst ab einer speziellen HP usebar.
}

Gui, 5: Show, Center h500 w700, Hitman Keybinder Einstellungen
Gui, 5: Add, Button, x485 y440 w100 h40 gSave_Einstellungen, Speichern
return

Save_Einstellungen:
GuiControlGet, Stats
GuiControlGet, Orgcall
GuiControlGet, Erstehilfe
GuiControlGet, Drugs
GuiControlGet, Fische
GuiControlGet, AktvierenHP
GuiControlGet, PaketUse
GuiControlGet, DrugsUse
GuiControlGet, FishUse
GuiControlGet, AutoMotorAus
GuiControlGet, angelType
GuiControlGet, Alock
GuiControlGet, ALight
GuiControlGet, coplist
GuiControlGet, fg



IniWrite, %AutoMotorAus%, settings.ini, Einstellung, AutoMotorAus
IniWrite, %angelType%, settings.ini, Einstellung, angelType
IniWrite, %Orgcall%, settings.ini, Einstellung, Orgcall
Iniwrite, %Stats%, settings.ini, Einstellung, Stats
IniWrite, %Erstehilfe%, settings.ini, Einstellung, Erstehilfe
Iniwrite, %Drugs%, settings.ini, Einstellung, Drugs
Iniwrite, %Fische%, settings.ini, Einstellung, Fische
IniWrite, %AktvierenHP%, settings.ini, Einstellung, AktvierenHP
IniWrite, %PaketUse%, settings.ini, Einstellung, PaketUse
IniWrite, %DrugsUse%, settings.ini, Einstellung, DrugsUse
IniWrite, %FishUse%, settings.ini, Einstellung, FishUse
IniWrite, %Alock%, settings.ini, Einstellung, Alock
IniWrite, %ALight%, settings.ini, Einstellung, ALight
IniWrite, %coplist%, settings.ini, Einstellung, Copliste
IniWrite, %fg%, settings.ini, Einstellung, Festgeld

MsgBox, 64, Einstellung, Einstellungen gespeichert. Lade Keybinder neu...
Reload
return
;}

Zurückstart:
Reload
return

Fest:
Gui, 6:Add, Picture, x0 y0 w770 h290 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 6: Add, Edit, x6 y7 w730 h220 ReadOnly, %Slashbinds%
Gui, 6: Add, Button, x6 y232 w100 h30 gZurückstart, Zurück
Gui, 6: Show, Center  h268 w747, Hitman Keybinder
return

BTdynHotSave: ;{
Loop 50
{
	GuiControlGet, command,, CMD%A_Index%
	if(command == "")
		continue
	
	IniWrite, %command%, Hotkeys.ini, Command, CMD%A_Index%
}
Reload ;}
return

Label: ;{
if %A_GuiControl% in +,^,!,+^,+!,^!,+^!
	return
	
num := SubStr(A_GuiControl, 3) 
if(savedHK%num%) {                         		
	Hotkey,% savedHK%num%, HotKey%num%, Off
	savedHK%num% .= " OFF"
	IniWrite, Keine, Hotkeys.ini, Hotkey, %num%
}

if(%A_GuiControl% = "") {  
	IniWrite, Keine, Hotkeys.ini, Hotkey, %num%
	savedHK%num% =
	return
}

Gui, Submit, NoHide
if(StrLen(%A_GuiControl%) == 1)
	%A_GuiControl% := "~" %A_GuiControl%

if(InStr(%A_GuiControl%, "Numpad"))
	%A_GuiControl% := "~" %A_GuiControl%

Hotkey,% %A_GuiControl%, HotKey%num%, On 
savedHK%num% := %A_GuiControl%
IniWrite, % %A_GuiControl%, Hotkeys.ini, Hotkey, %num% ;}
return


XTaste:
if(IsPlayerInAnyVehicle() && IsPlayerDriver())
{
	if(IsPlayerInRangeOfPoint(614.7936,1689.5481,6.5567, 10) || IsPlayerInRangeOfPoint(-1328.5437,2677.2109,49.6285, 10) || IsPlayerInRangeOfPoint(1595.7455,2198.9319,10.3875, 10) || IsPlayerInRangeOfPoint(2202.3479,2473.9041,10.3849, 10) || IsPlayerInRangeOfPoint(2113.8887,920.1363,10.3840, 10) || IsPlayerInRangeOfPoint(-2408.7478,975.8612,44.8655, 10) || IsPlayerInRangeOfPoint(-2029.3025,156.4132,28.4108, 10) || IsPlayerInRangeOfPoint(-1676.3165,414.2832,6.7490, 10) || IsPlayerInRangeOfPoint(1004.1802,-939.2733,41.7504, 10) || IsPlayerInRangeOfPoint(1944.1013,-1772.9907,12.9622, 10) || IsPlayerInRangeOfPoint(-90.6283,-1169.5378,1.9707, 10) || IsPlayerInRangeOfPoint(-1605.3982,-2714.4424,48.5335, 10) || IsPlayerInRangeOfPoint(-2243.8896,-2560.5569,31.9219, 10) || IsPlayerInRangeOfPoint(1380.9418,457.1429,19.4861, 10) || IsPlayerInRangeOfPoint(70.4341,1218.6842,18.3743, 10) || IsPlayerInRangeOfPoint(1555.4310,-1605.5901,13.1827, 10))
	{
		AddChatMessage(" |{01DF01}Hitman{FFFFFF}| Du kannst jetzt dein Fahrzeug betanken. Drück '{FFBF00}X{FFFFFF}' zum bestätigen.")
		KeyWait, X, D, T10
		if !Errorlevel
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
		AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Möchtest du den Zoll jetzt öffnen? Zum öffnen '{FFBF00}X{FFFFFF}' drücken.")
		Settimer, XTaste, off
		KeyWait, X, D, T10
		if !ErrorLevel
		{
			Settimer, XTaste, 500
			SendChat("/zoll")
			GetChatLine(0, chat)
			if(InStr(chat, "Es ist keine Zoll Station in deiner Nähe"))
			{
				Sleep, 800
				SendChat("/zoll")
				Sleep 5000
			}
			Sleep 5000
		}
		Settimer, XTaste, 500
	} else if(isPlayerInRangeOfPoint(330.7347,-40.3479,2.2255, 2))
	{
		AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Möchtest du dir Drogen kaufen? Zum kaufen '{FFBF00}X{FFFFFF}' drücken.")
		Settimer, XTaste, off
		KeyWait, X, D, T10
		if !ErrorLevel
		{
			SendChat("/seed buy")
			Sleep, 5000
		}
		Sleep 5000
		Settimer, XTaste, 500
	}
}
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
 
Find:
Settimer, Find, 6000
SendChat("/find " . AID)
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
	AddChatMessage("|{01DF01}Hitman{FFFFFF}|Anti-Spam Schutz aktiviert.")
	sleep, 3000
	AddChatMessage("|{01DF01}Hitman{FFFFFF}|Anti-Spam Schutz deaktiviert.")
	unblockChatInput()
}
return

Timer:
if(!WinActive("GTA:SA:MP"))
	return

GetChatLine(0, Chatline)
if(InStr(Chatline, "|=================||============||=================|")){
	gesamtmoney:=0
	Loop, 6
	{
		GetChatLine(A_Index-1,Chatline)
		if(InStr(Chatline,"Lohnsteuer: ")){
			RegExMatch(Chatline,"Lohn\: (.*)\$     Miete\: \-(.*)\$     Lohnsteuer\: \-(.*)\$",var)
			gesamtmoney:=gesamtmoney+var1
			gesamtmoney:=gesamtmoney-var2
			gesamtmoney:=gesamtmoney-var3
		}else if(InStr(Chatline,"KFZ Steuer: ")){
			RegExMatch(Chatline,"KFZ Steuer\: \-(.*)\$",var)
			gesamtmoney:=gesamtmoney-var1
		}
	}
	AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du hast beim Payday " . gesamtmoney . "$ erhalten.")
}

GetChatLine(0, Link)
IfInString, Link, http
{
res :=  SubStr(Link,(s := InStr(Link,"http://")),InStr(Link,"/",0,1,3) - s + 1)
If(!InStr(Link, radio))
AddChatMessage("[Link] Es wurde ein Link erkannt und in der Zwischenablage gespeichert")
Clipboard := res
}

GetChatLine(0, Chatline)
if(InStr(Chatline, "Deine Identität ist wieder sichtbar")){
	AddChatMessage("|{01DF01}Hitman{FFFFFF}| Deine Identität ist nicht mehr versteckt!")
}
return

contracts:
GetChatLine(0, Line1)
GetChatLine(2, Line3)
username := GetUsername()
url := ""
urli := ""
regex_ := ""
regex_2 := ""
result1 := ""
result2 := ""
output1_ := ""
output1_1 := ""
output1_2 := ""
output1_3 := ""
output2_ := ""
output2_1 := ""
output2_2 := ""
output2_3 := ""
output2_4 := ""
output2_5 := ""
if(InStr(Line1, "<< Hitman " username " hat den Auftrag ausgeführt und"))
{
	RegExMatch(Line1, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet. >>", regex_)
	contracting := -1
	contractupload(username, regex_2)
	
}
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und"))
{
	
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet. >>", regex_)
	contracting := -1
	
	contractupload(username, regex_2)
	
	
}
return

~F::
if(IsInChat())
return
if(AutoMotorAus == 1)
{	
	Sleep, 250
	if(IsPlayerInAnyVehicle())
	{
		if(IsPlayerDriver())
		{
			if(getVehicleEngineState())
			{
				SendChat("/motor")
			}
		}
	}
}
return

;Motor An/Aus
HotKey1: 
if(IsInChat())
	return
if(IsPlayerInAnyVehicle() == "0")
{
	AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du bist in keinem Fahrzeug")
}
else
{
    If(IsPlayerDriver() == 0)
    {
		AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du bist nicht der Fahrer eines Fahrzeuges.")
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

;Auto lock
HotKey2:
if(IsInChat())
	return
if(IsPlayerInAnyVehicle() == "0")
{
        AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du befindest dich in keinem Fahrzeug.")
}
else
{
        SendChat("/lock")
}
return

;Members
HotKey3:
if(IsInChat())
	return
SendChat("/members")
return


;Orgmembers
HotKey4:
if(IsInChat())
	return
SendChat("/crewmembers")
return


;Fische essen 1-5 
HotKey5:
Iniread, Fische, settings.ini, Einstellung, Fische
Iniread, FishUse, settings.ini, Einstellung, FishUse
if(IsInChat())
	return

if(Fische == 1)
{
	if(getPlayerHealth() > FishUse)
	{
		AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . FishUse . " HP{FFFFFF} Fische essen.")
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
	AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du hast alle Fische Verbraucht.")
}

return

;usedrugs
HotKey6:
Iniread, Drugs, settings.ini, Einstellung, Drugs
Iniread, DrugsUse, settings.ini, Einstellung, DrugsUse
if(IsInChat())
	return
if(Drugs == 1)
{
		if(getPlayerHealth() > DrugsUse) 
		{
			AddChatMessage("|{01DF01}Hitman{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . DrugsUse . " HP{FFFFFF} deine Drogen benutzen.")
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
HotKey7:
Iniread, Erstehilfe, settings.ini, Einstellung, Erstehilfe
Iniread, PaketUse, settings.ini, Einstellung, PaketUse
if(IsInChat())
	return
if(Erstehilfe == 1)
{
	if(GetPlayerHealth() > PaketUse) 
		{
			AddChatMessage("|{01DF01}Hitman{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . PaketUse . " HP{FFFFFF} dein Erstehilfe Paket benutzen.")
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
HotKey8:
zone := getPlayerZone() 
City := getPlayerCity()
if(!IsInChat())
{
	If(backup == 1)
	{
		SendChat("/F Ich benötige DRINGEND Verstärkung in " zone ", " City " | Ich habe die ID: " . getId() . " | Ich habe noch " . GetPlayerHealth() . " HP") 
		if(OrgCall == 1)
		{
			SendChat("/crew Ich benötige DRINGEND Verstärkung in " zone ", " City " | Ich habe die ID: " . getId() . " | Ich habe noch " . GetPlayerHealth() . " HP")   
		}
	}
	else
	{
		SendChat("/F Ich benötige Verstärkung in " zone ", " City " | Ich habe die ID: " . getId() . " | Ich habe noch " . GetPlayerHealth() . " HP")   
		if(OrgCall == 1)
		{
			SendChat("/crew Ich benötige Verstärkung in " zone ", " City " | Ich habe die ID: " . getId() . " | Ich habe noch " . GetPlayerHealth() . " HP") 
		}
		backup := 1
	}
}
return

;Bkend
HotKey9:
if(IsInChat())
	return
SendChat("/f Verstärkung wird NICHT mehr benötigt!")
backup := 0
if(OrgCall == 1)
{
    SendChat("/crew Verstärkung wird NICHT mehr benötigt!")
}
return

;BKHelp
HotKey10:
if(IsInChat())
	return
SendChat("/F Ich bin Unterwegs | Ich befinde mich in: " city ", " zone " ")
if(OrgCall == 1)
{
	SendChat("/crew Ich bin Unterwegs | Ich befinde mich in: " city ", " zone " ")
}
return

;PosF
HotKey11:
if(IsInChat())
	return
 SendChat("/F Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;PosOrg
HotKey12:
if(IsInChat())
	return
SendChat("/crew Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;Letzter Befehl
HotKey13:
if(IsInChat())
	return
SendInput t{up}{enter}
return

;Keybinder Pausieren
HotKey14:
if(IsInChat())
	return
SetTimer, Find, Off
SetTimer, Show, Off
SetTimer, GK, Off
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Automatisches Findsystem deaktiviert.") 
return

;Hacken
HotKey15:
if(IsInChat())
	return
SendChat("/mask")
return

;Accept Hitman
HotKey16:
if(IsInChat())
	return
SendChat("/oldcontracts")
return


;Whzurücklegen
HotKey17:
if(IsInChat())
	return
SendChat("/hram")
return

;CancelHitman
HotKey18:
if(IsInChat())
	return
IniRead, contracting, settings.ini, Zielperson, contract, -1
if(contracting == -1){
	AddChatMessage("|{01DF01}Hitman{FFFFFF}| Leer lassen um Abzubrechen")
	contracting := PlayerInput("/Zielperson: ")
	if(contracting == "")
	{
		AddChatMessage("|{01DF01}Hitman{FFFFFF}| Abgebrochen.")
		return
	} else {
		AddChatMessage("|{01DF01}Hitman{FFFFFF}| Möchtest Du diese Person automatisch suchen lassen? Drücke 'X'")
		KeyWait, X, D, T3
		if !ErrorLevel
		{
			AID := contracting
			contracting := GetPlayerNameByID(AID)
			IniWrite, %contracting%, settings.ini, Zielperson, contract
			Settimer, Find, On
		} else {
			contracting := GetPlayerNameByID(contracting)
			IniWrite, %contracting%, settings.ini, Zielperson, contract
		}
	}
} else {
	SendChat("/deathcontract " contracting)
	Sleep 500
	GetChatLine(0, Lines1)
	if(InStr(Lines1, "Du bist an keinem")){
		SendChat("/offlinecontract " contracting)
		Sleep 500
		GetChatLine(0, Liness1)
		if(InStr(Liness1, "Du bist an keinem")){
			contracting := -1
			IniWrite, %contracting%, settings.ini, Zielperson, contract
			AddChatMessage("|{01DF01}Hitman{FFFFFF}|Konnte Spieler nicht Death/Offlinecontracten. Verwende zurnot /oc oder /dc")
		} else {
			GetChatLine(2, Line3)
			if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (offline)")){
				RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
				contracting := -1
				contractupload(username, regex_2)
			}
		}
	} else {
		GetChatLine(2, Line3)
		if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (offlinearrest)")){
			RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
			contracting := -1
			contractupload(username, regex_2)
		}
	}
}

return


HotKey19:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil1_1 . " " . Profil1_2 . " " . Profil1_3 . " " . Profil1_4 . " " . Profil1_5 . " " . Profil1_6 . " " . Profil1_7 . " " . Profil1_8 . " " . Profil1_9 . " " . Profil1_10 . "")
Sleep, 500
SendChat("/heal")
return


HotKey20:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil2_1 . " " . Profil2_2 . " " . Profil2_3 . " " . Profil2_4 . " " . Profil2_5 . " " . Profil2_6 . " " . Profil2_7 . "")
Sleep, 500
SendChat("/heal")
return



Hotkey21:
printHotkey(21)
return
HotKey22:
printHotkey(22)
return
HotKey23:
printHotkey(23)
return
HotKey24:
printHotkey(24)
return
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

:?:/fg::
SendChat("/festgeld " fg)
return


:?:/gk::
Suspend Permit
gk := PlayerInput("Welchen GK suchst du? ")
if(gk=="")
return
gk_search(gk)
return

~Pause::
Suspend 
If (A_IsSuspended)
{
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| {F0F0F0}Keybinder {B40404}deaktiviert{F0F0F0}.")
ShowGameText("~r~Keybinder ~r~ deaktiviert", 2000, 3)
paused = 1
Suspend permit
}
if (!A_IsSuspended)
{
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| {F0F0F0}Keybinder {088A4B}aktiviert{F0F0F0}.")
ShowGameText("~g~Keybinder ~g~ aktiviert", 2000, 3)
paused = 0
Suspend off
}
        return

:?:/tr::
Suspend Permit

Zahl1 := PlayerInput("Zahl 1: ")
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Es gibt folgende Aktionen: + - * /") 
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
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Das Ergebnis lautet: {01DF01}" . calcresult . "")
return


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


/*
InteriorID := 24/7 == ID:10


*/


:?:/FishHP::
Suspend Permit
angelType := 1
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch weg, der die wenigsten HP bringt.")
return

:?:/FishGeld::
Suspend Permit
angelType := 2
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch mit den billigstens Verkaufpreis weg.")
return

:?:/FishNix::
Suspend Permit
angelType := 3
AddChatMessage("|{01DF01}Hitman{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' keinen Fisch weg")
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
						}
						else if(fishes_var2 == "Bernfisch"){
							moneyGesamt += Floor(fishes_var3 * 1)
						}else if(fishes_var2 == "Blauer Fächerfisch"){
							moneyGesamt += Floor(fishes_var3 * 2)
						}else if(fishes_var2 == "Schwertfisch" || fishes_var2 == "Zackenbarsch" || fishes_var2 == "Roter Schnapper"){
							moneyGesamt += Floor(fishes_var3 * 2)
						}else if(fishes_var2 == "Katzenfisch"){
							moneyGesamt += Floor(fishes_var3 * 3)
						}else if(fishes_var2 == "Forelle"){
							moneyGesamt += Floor(fishes_var3 * 3)
						}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
							moneyGesamt += Floor(fishes_var3 * 4)
						}else if(fishes_var2 == "Makrele"){
							moneyGesamt += Floor(fishes_var3 * 5)
						}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
							moneyGesamt += Floor(fishes_var3 * 6)
						}else if(fishes_var2 == "Schildkröte"){
							moneyGesamt += Floor(fishes_var3 * 8)
						}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
							moneyGesamt += Floor(fishes_var3 * 8)
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
						moneyGesamt += Floor(fishes_var3 * 2)
					}else if(fishes_var2 == "Katzenfisch"){
						moneyGesamt += Floor(fishes_var3 * 3)
					}else if(fishes_var2 == "Forelle"){
						moneyGesamt += Floor(fishes_var3 * 3)
					}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
						moneyGesamt += Floor(fishes_var3 * 4)
					}else if(fishes_var2 == "Makrele"){
						moneyGesamt += Floor(fishes_var3 * 5)
					}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
						moneyGesamt += Floor(fishes_var3 * 6)
					}else if(fishes_var2 == "Schildkröte"){
						moneyGesamt += Floor(fishes_var3 * 8)
					}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
						moneyGesamt += Floor(fishes_var3 * 8)
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
		moneyGesamt += Floor(fishes_var3 * 2)
	}else if(fishes_var2 == "Katzenfisch"){
		moneyGesamt += Floor(fishes_var3 * 3)
	}else if(fishes_var2 == "Forelle"){
		moneyGesamt += Floor(fishes_var3 * 3)
	}else if(fishes_var2 == "Delphin" || fishes_var2 == "Hai" || fishes_var2 == "Segelfisch"){
		moneyGesamt += Floor(fishes_var3 * 4)
	}else if(fishes_var2 == "Makrele"){
		moneyGesamt += Floor(fishes_var3 * 5)
	}else if(fishes_var2 == "Hecht" || fishes_var2 == "Aal"){
		moneyGesamt += Floor(fishes_var3 * 6)
	}else if(fishes_var2 == "Schildkröte"){
		moneyGesamt += Floor(fishes_var3 * 8)
	}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
		moneyGesamt += Floor(fishes_var3 * 8)
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


:?:/p::
SendChat("/p")
SendChat("Guten Tag, Sie sind verbunden mit " name ".")
SendChat("Was kann ich für Sie tun?")
return

:?:/h::
SendChat("Vielen Dank für Ihren Anruf.")
SendChat("/h")
return

:?:/ab::
SendChat("/p")
SendChat("Guten Tag, leider bin ich momentan nicht Erreichbar.")
SendChat("/h")
return

:?:/pb::
SendChat("/paintball")
return


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
                        AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Versendung nicht möglich!")
                        return
                }
                else
                {
                        continue
                }
}
return


:?:/sad::
Suspend Permit
SendChat("/ad " . Werbung . "")
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


 :?:/cd::
Suspend Permit
zahli := 0
AddChatMessage("|{01DF01}Hitman{FFFFFF}| Gib eine Zahl für deinen Countdown ein")
zahl := PlayerInput("/Countdown: ")
AddChatMessage("|{01DF01}Hitman{FFFFFF}| Du kannst den Countdown mit '{FFBF00}<{FFFFFF}' beenden.")
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
	AddChatMessage("|{01DF01}Hitman{FFFFFF}|" . fisch%A_Index%_1 . " (" . fisch%A_Index%_2 . " LBS) - {FFA000} " . HP%A_Index% . " HP")
}

AddChatMessage( "|{01DF01}Hitman{FFFFFF}|Die Fische bringen dir Gesamt: {FFA000}" . HP . " HP")
return



:?:/min::
Suspend Permit
Sekunden := PlayerInput("Anzahl der Sekunden: ")
if(Sekunden != "" && Sekunden != " " && Sekunden != 0)
{
        Minuten := Sekunden / 60
        Minuten := round(Minuten, 2)
        AddChatMessage( "|{01DF01}Hitman{FFFFFF}|{3ADF00}" Sekunden "{FFFFFF} Sekunden sind {3ADF00}" Minuten "{FFFFFF} Minuten.")
}
return
 
:?:/db::
Suspend Permit
SendChat("/drink bier")
Sleep 100
SendChat("/drink bier")
return



:?:/alotto::
Suspend Permit
Random, rand, 1, 200
SendChat("/lotto " rand)
return

:?:/aall::
Suspend, Permit
Geld_Vorher := GetPlayerMoney()
Sleep, 250
SendChat("/ausruesten all")
Sleep, 250
Geld_Nachher := GetPlayerMoney()
GesamtGeld := Geld_Nachher - Geld_Vorher
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Du hast alle Waffen für {FF0000}" . GesamtGeld . "{FFFFFF}$ ausgerüstet.")
return


:?:/ac::
Suspend Permit
Loop, read, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
{
    If InStr(A_LoopReadLine, "/accept drugs")
    {
        Service = drugs
    }
    else If InStr(A_LoopReadLine, "/accept kaution")
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

:?:/oc::
targetID := PlayerInput("/Offlinecontract: ")
SendChat("/offlinecontract " targetID)
GetChatLine(2, Line3)
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (offlinearrest)")){
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
return

:?:/dc::
targetID := PlayerInput("/deathcontract: ")
SendChat("/deathcontract " targetID)
GetChatLine(2, Line3)
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (deatharrest)")){
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
return

:?:/cc::
:?:/clear::
:?:/chatclear::
Suspend Permit
Loop 300
{
  AddChatMessage( " ")
}
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Chatclear abgeschlossen")
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
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
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
AddChatMessage( "|{01DF01}Hitman{FFFFFF}| Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Vorrübergehende Copliste

:?:/cops::
copscount := 0
member1 := ""
cops := ""
result := ""
UrlDownloadToVar("http://hitman.jameschans.de/keybinder/allcops.php", result)
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
	AddChatMessage("|{01DF01}Hitman{FFFFFF}| Es sind " copscount " Cops online")
} else if(copscount == 0){
	AddChatMessage("|{01DF01}Hitman{FFFFFF}| Es sind 0 Cops online")
}
return

:?:/addcop::
Suspend Permit
playername := GetUsername()
name := PlayerInput("/Cop-Name: ")
url = http://wheelman.jameschans.de/keybinder/addcop.php?name=%name%&uname=%playername%
URLDownloadToVar(url, result)
if(result == 1 || result == 11)
{
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast den Cop " name " hinzugefügt")
} else if(result == -2){
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du darfst das nicht tun!")
} else if(result == 0) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Copname/Username leer")
} else if(result == -1) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Variable fehlt")
} else if(result == -3) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Dieser Cop steht bereits auf der Liste")
}
return

:?:/delcop::
Suspend Permit
username := GetUsername()
name := PlayerInput("/Cop-Name: ")
url = http://wheelman.jameschans.de/keybinder/delcop.php?name=%name%&uname=%username%
URLDownloadToVar(url, result)
if(result == 1)
{
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du hast den Cop " name " gelöscht")
} else if(result == -2){
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Du darfst das nicht tun!")
} else if(result == 0) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Copname/Username leer")
} else if(result == -1) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Variable fehlt")
} else if(result == -3) {
	AddChatMessage("|{01DF01}Wheelman{FFFFFF}| Dieser Cop steht nicht auf der Liste")
}
return

:?:/relog::
addChatMessage("|{01DF01}Hitman{FFFFFF}| Du verbindest nun neu...")
restart()
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

contractupload(username, geld){
	url = http://hitman.jameschans.de/keybinder/addhitman.php?name=%username%&einnahme=%geld%
	urli = http://hitman.jameschans.de/keybinder/dm/addhitman.php?name=%username%&einnahmen=%geld%
	URLDownloadToVar(url, result1)
	URLDownloadToVar(urli, result2)
	StringSplit, output1_, result1, ~
	StringSplit, output2_, result2, ~
	IniWrite, -1, settings.ini, Zielperson, contract
	if(output1_1 == 1){
	AddChatMessage("|{01DF01}Hitman{FFFFFF}| Ausgeführte Contracts: " FormatNumber(output1_2) " --- Einnahmen: " FormatNumber(output1_3))
	} else {
		AddChatMessage(output1_1)
		AddChatMessage(output1_2)
		AddChatMessage("Datenbankfehler" output1_2 " ~~ Bitte an John_Reese wenden")
	}
	if(output2_1 == 1)
	{
		AddChatMessage("|{01DF01}Hitman{FFFFFF}| Ausgeführte Contracts ( Monat ): " FormatNumber(output2_4) " --- Einnahmen ( Monat ): " FormatNumber(output2_5))
		AddChatMessage("|{01DF01}Hitman{FFFFFF}| Ausgeführte Contracts ( Woche ): " FormatNumber(output2_2) " --- Einnahmen ( Woche ): " FormatNumber(output2_3))
	} else {
		AddChatMessage(output2_1)
		AddChatMessage(output2_2)
		AddChatMessage("Datenbankfehler " output2_2 " ~~ Bitte an John_Reese wenden")
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
 
 
 
 
 GuiClose:
Gui, Destroy
IniWrite, -1, settings.ini, Zielperson, contract
ExitApp
return





