#Include API.ahk
#ifWinActive, GTA:SA:MP
#SingleInstance, force
#Persistent
#UseHook
#NoEnv
Menu, Tray, NoStandard
Menu, Tray, Add , Schlie�en, GuiClose

;php PW rwrg21wah45z6g1y6ea
;Keybinder bis zum Agency Release

ifExist, updater.exe
        FileDelete, updater.exe
		
IfNotExist, background.png
	URLDownloadToFile, http://wheelman.jameschans.de/keybinder/background.png, background.png

keybinderVersion := 4.7
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
        MsgBox, 68, Update verf�gbar, Lieber Benutzer,`nes ist ein neues Update f�r den Keybinder verf�gbar ( Version %result_% ).`nM�chtest Du nun updaten?
        IfMsgBox, Yes
        {
                MsgBox, 68, Update wird heruntergeladen!, Das Update wird nun heruntergeladen, 3
                URLDownloadToFile, http://wheelman.jameschans.de/keybinder/updater.exe, updater.exe
                MsgBox, 68, Updater start, Der Updater wird nun gestartet und der Keybinder geschlossen., 3
                run, updater.exe
                ExitApp
        }
}


Settimer, hacken, 150
SetTimer, Grabben, On
SetTimer, fee, 1000
SetTimer, XTaste, 500
SetTimer, Alotto, 1000
SetTimer, antiSpam, On
Settimer, clearvariable, 20000
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
IniRead, Stats, settings.ini, Einstellung, Stats
IniRead, Erstehilfe, settings.ini, Einstellung, Erstehilfe
IniRead, Drugs, settings.ini, Einstellung, Drugs
IniRead, Fische, settings.ini, Einstellung, Fische
IniRead, AktvierenHP, settings.ini, Einstellung, AktvierenHP
IniRead, PaketUse, settings.ini, Einstellung, PaketUse
IniRead, DrugsUse, settings.ini, Einstellung, DrugsUse
IniRead, FishUse, settings.ini, Einstellung, FishUse
IniRead, FeeEinstell, settings.ini, Einstellung, FeeEinstell
IniRead, FeeEinstellung, settings.ini, Einstellung, FeeEinstellung
IniRead, angelType, settings.ini, Einstellung, angelType, 3
IniRead, AutoMotorAus, settings.ini, Einstellung, AutoMotorAus
IniRead, ALotto_An, settings.ini, Einstellung, Alotto_An
IniRead, ALotto_Preis, settings.ini, Einstellung, ALotto_Preis
IniRead, ALotto_rnd, settings.ini, Einstellung, ALotto_rnd
IniRead, ALotto_zahl, settings.ini, Einstellung, ALotto_zahl
IniRead, Alock, settings.ini, Einstellung, Alock
InIRead, ALight, settings.ini, Einstellung, ALight
IniRead, coplist, settings.ini, Einstellung, Copliste, 2
IniRead, fg, settings.ini, Einstellung, Festgeld, 1250000
IniRead, XTasteOn, settings.ini, Einstellung, XTasteOn
IniRead, oldcontracts, settings.ini, Einstellung, oldcontracts


;Werbung
IniRead, Werbung, settings.ini, AD, Werbung
;Kidnap
IniRead, Fahrer, settings.ini, Kidnap, Fahrer
IniRead, Opfer, settings.ini, Kidnap, Opfer
IniRead, Sitz, settings.ini, Kidnap, Sitz
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


Hitman
============================================================================================================
/oc`t`t`t-`t`tOffline Contract
/dc`t`t`t-`t`tDeath Contract
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
============================================================================================================


KIDNAP
============================================================================================================
/fahrer`t`t`t-`t`tgibt dein Partner an (Auch f�r Kidnap(Fahrer))
/sitz`t`t`t-`t`tgibt die Position an, f�r das Kidnap-Opfer
/opfer`t`t`t-`t`tgibt das Kidnap-Opfer an
/kidinfo`t`t`t-`t`tZeigt deinen Partner, Platz & Opfer an
/sad`t`t`t-`t`t F�hrt die Eingene AD aus
/gk`t`t`t-`t`t manuelle Gk abfrage
============================================================================================================


TASTEN
============================================================================================================
Pause`t`t`t-`t`tPausierte den Keybinder
X`t`t`t-`t`t�ffnet zoll/tankt das fahrzeug
#`t`t`t-`t`tF�hrt das Kidnapsystem aus
============================================================================================================


COPLISTE
============================================================================================================
/cops`t`t`t-`t`tZeigt alle Cops an die gerade Online sind
/delcop`t`t`t-`t`tEntfernt einen Cop.
/addcop `t`t`t-`t`tF�gt einen Cop hinzu
)

;{ ======= Inilesen
Loop, 30
{
	IniRead, CMD%A_Index%, Hotkeys.ini, Command, CMD%A_Index%, %A_Space%
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	
	if(HK%A_Index% != "Keine")
        Hotkey, % HK%A_Index%, HotKey%A_Index%, On
} ; Oben ins Script


URLDownloadToFile, http://wheelman.jameschans.de/keybinder/info.txt, info.txt
FileRead, information, info.txt
Sleep 100
FileDelete, info.txt

 Gui, Destroy
 Gui, Add, Edit, x0 y0 w0 h0 +ReadOnly,
 Gui, Add, Picture, x-8 y-31 w910 h650 +BackGroundTrans, %A_ScriptDir%\background.png
; Gui, Tab, Start

Loop, 30
{
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	StringReplace, HK%A_Index%, HK%A_Index%, ~,,
}

; = Spalte 1
y := 39
Loop, 14
{
	Gui, Add, Hotkey, x25 y%y% w90 h20 vHK%A_Index% gLabel, % HK%A_Index%
	y += 40
}
;}

;{
Gui, Add, text, x132 y39 +BackGroundTrans cwhite, Motor An/Aus
Gui, Add, text, x132 y80 +BackGroundTrans cwhite, Fahrzeug Abschlie�en
Gui, Add, text, x132 y120 +BackGroundTrans cwhite, Members
Gui, Add, text, x132 y160 +BackGroundTrans cwhite, Crewmembers
Gui, Add, text, x132 y200 +BackGroundTrans cwhite, Fisch Essen (1-5)
Gui, Add, text, x132 y240 +BackGroundTrans cwhite, usedrugs 
Gui, Add, text, x132 y280 +BackGroundTrans cwhite, Erstehilfe 
Gui, Add, text, x132 y320 +BackGroundTrans cwhite, Call Backup
Gui, Add, text, x132 y360 +BackGroundTrans cwhite, Cancel Backup
Gui, Add, text, x132 y400 +BackGroundTrans cwhite, Help Backup
Gui, Add, text, x132 y440 +BackGroundTrans cwhite, Ejected alle im Car
Gui, Add, text, x132 y480 +BackGroundTrans cwhite, Buykit
Gui, Add, text, x132 y520 +BackGroundTrans cwhite, Usekit
Gui, Add, text, x132 y560 +BackGroundTrans cwhite, Mask
Gui, Add, Text, x225 y440 ginfoejected +BackGroundTrans cwhite, 

; == Spalte 2
y := 39
cmdcount := 15
Loop, 14
{
	Gui, Add, Hotkey, x312 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	y += 40
	cmdcount++
}
Gui, Add, text, x422 y39 +BackGroundTrans cwhite, Position Im F-Chat
Gui, Add, text, x422 y80 +BackGroundTrans cwhite, Position im Org-Chat
Gui, Add, text, x422 y120 +BackGroundTrans cwhite, Letzten Befehl Wiederholen
Gui, Add, text, x422 y160 +BackGroundTrans cwhite, Auto. Findystem Deaktiveren
Gui, Add, text, x422 y200 +BackGroundTrans cwhite, Hackvorgang Starten
Gui, Add, text, x422 y240 +BackGroundTrans cwhite, Accept Wheelman
Gui, Add, text, x422 y280 +BackGroundTrans cwhite, Revert Auftrag
Gui, Add, text, x422 y320 +BackGroundTrans cwhite, Cancel Wheelman
Gui, Add, text, x422 y360 +BackGroundTrans cwhite, Ausruesten(V1)
Gui, Add, text, x422 y400 +BackGroundTrans cwhite, Ausruesten(V2)
Gui, Add, text, x422 y440 +BackGroundTrans cwhite, Hram
Gui, Add, text, x422 y480 +BackGroundTrans cwhite, Contracts
Gui, Add, text, x422 y520 +BackGroundTrans cwhite, Tor auf
Gui, Add, text, x422 y560 +BackGroundTrans cwhite, Hide

; == Spalte 3
y := 39

cmdcount := 29
Loop, 11
	
{ 
	Gui, Add, Hotkey, x592 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	Gui, Add, edit, x702 y%y% w90 h20 vCMD%cmdcount%, % CMD%cmdcount%
	y += 40
	cmdcount++
}


;~ Groupbox Belegbar
Gui, Add, text, x10 y5 +BackgroundTrans cwhite, Belegbare Hotkeys
Gui, Add, Groupbox, x10 y15 w880 h585  +BackGroundTrans cwhite,


;~ Buttons

Gui, Add, Button, x570 y535 w90 h40 gEbinds cwhite, Variablen
Gui, Add, Button, x570 y485 w90 h40 gEinstellungen cwhite, Einstellungen
Gui, Add, Button, x670 y535 w90 h40 gFest, Keybinds 
Gui, Add, Button, x670 y485 w90 h40 gBTdynHotSave, Speichern
Gui, Add, Button, x770 y535 w90 h40 gconnect cwhite, Direct Connect
Gui, Add, Button, x770 y485 w90 h40 guseless cwhite, Letztes Update

;~ Headline
Gui, Add, Text, x765 y5 +BackGroundTrans cwhite, � made by Pietro_Miller 


;~ Gui Show

Gui, Show, w900 h620, Agency Keybinder V %keybinderVersion%
return
;}

connect:
RegRead GTA_SA_EXE, HKEY_CURRENT_USER, Software\SAMP, GTA_SA_EXE 
SplitPath, GTA_SA_EXE,, PFAD 
Run, %PFAD%\samp.exe server.rpg-city.de:7777
return

useless:
MsgBox, 64,Update 4.5, Funktionen Hinzugef�gt:`n`nEinstellbar, ob die X-Funktion aktiv ist oder nicht`nEject schmei�t alle leute aus dem Fahrzeug`ne & 1-3 `tschmei�t User auf den Pl�tzen 1-3 raus.`n/tu`t/tie /untie alle im car`n/ut`t/untie /tie alle im car`n/tu1-3`t/tie /untie Platz 1-3`n/ut1-3`t/untie /tie Platz 1-3 
return


infoejected:
MsgBox, 64, Info Eject System, Stellen sie die Taste ein um alle Personen im Car automatisch zu Ejecten.`nDie Funktion ist mit den Tasten Ausgew�hlte Taste + 1-3.`nPro Shortcut wird die Person auf Sitz 1-3 ejectet.
return

Sad:

;Gui, 2: New
Gui, 2: Add, Picture, x0 y0 w450 h250 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 2: Add, Edit, x30 y137 w250 h20 vWerbung, %Werbung%
Gui, 2: Add, Button, x285 y133 w60 h25 gSpeichern_AD, Speichern
Gui, 2: Add, GroupBox, x12 y9 w337 h170 +BackgroundTrans,
Gui, 2: Add, Text, x15 y3 cwhite +BackgroundTrans, Eigene advertising
Gui, 2: Add, Text, x36 y40 w300 h80  +BackGroundTrans cwhite, Herzlich Willkommen bei deinem individuelles advertising-Profil.`nHier kannst du dein Pers�nliche Werbung erstellen mit deiner Eigener Variation. F�ge in das Fenster deine eigene Werbung ein wie du sie haben M�chtest`n z.B Du wirst gerade Verhaftet / Willst keine Wanteds mehr haben? /service -> Wheelman`nDas /ad musst du nicht machen.

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
Gui, 3: Add, Text, x22 y29 w910 h70 +BackgroundTrans cwhite, Herzlich Willkommen bei deinem individuelles Ausr�st-Profil.`nHier kannst du dein Pers�nliches Ausr�st Profil erstellen mit deinen Eigener Variation f�r das Ausruesten.`nDu kannnst auch deine Eigene Taste ausw�hlen mit der du dich ausr�sten m�chtest. `nWICHTIG: Der erste Waffenslot darf nicht leer sein | Die Hotkeys f�r das Ausr�stProf, kannst Du auf der Startseite Festlegen.
Gui, 3: Add, GroupBox, x12 y9 w800 h75 , 
Gui, 3: Add, GroupBox, x12 y108 w800 h153 ,
Gui, 3: Add, Text, x12 y102 +BackgroundTrans cwhite, Information
Gui, 3: Add, Text, x12 y3 +BackgroundTrans cwhite, Ausruesten
Gui, 3: Add, DropDownList, x22 y137 w90 h110 vProfil1_1, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x122 y137 w90 h110 vProfil1_2, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x222 y137 w90 h110 vProfil1_3, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x322 y137 w90 h110 vProfil1_4, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x422 y137 w90 h110 vProfil1_5, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x522 y137 w90 h110 vProfil1_6, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x622 y137 w90 h110 vProfil1_7, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
;V2
Gui, 3: Add, DropDownList, x22 y172 w90 h110 vProfil2_1, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x122 y172 w90 h110 vProfil2_2, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x222 y172 w90 h110 vProfil2_3, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x322 y172 w90 h110 vProfil2_4, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x422 y172 w90 h110 vProfil2_5, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x522 y172 w90 h110 vProfil2_6, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen
Gui, 3: Add, DropDownList, x622 y172 w90 h110 vProfil2_7, ||Messer|Deagle|Shotgun|MP5|M4|Sniper|Drogen

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

Gui, 3: Show, w822 h273, Ausr�sten
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
Gui, 4: add, Text, x27 y29 +BackgroundTrans cwhite, Verf�gbare Labels:`n`n[HP] => Gibt die HP aus`n`n[Land] => Gibt das Land aus`n`n[Stadt] => Gibt die Stadt aus`n`n[Veh] => Gibt den Fahrzeugname aus`n`n[VehHP] => Gibt die Fahrzeughp aus`n`n
Gui, 4: add, Text, x227 y29 +BackgroundTrans cwhite,  `n`n[Kill] => Gibt die aktuellen Kills aus`n`n[Death] => Gibt die aktuellen Tode aus`n`n[KD] => Gibt die KD aus`n`n[HEAL] => Healt sich bei <100 HP`n`n[MOTOR] => Motorsystem
Gui, 4: Add, Button, x12 y217 w100 h40 gZur�ckstart, Zur�ck
Gui, 4: Add, GroupBox, x12 y9 w403 h200 +BackgroundTrans cwhite,
Gui, 4: add, text, x12 y4 +BackgroundTrans cwhite, Variablen

Gui, 4: Show, Center  h268 w427, Wheelman Keybinder
return

Einstellungen:
;{

Gui, 5:Add, Picture, x0 y0 w780 h550 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 5: Add, GroupBox, x12 y9 w360 h312 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x13 y2 +BackgroundTrans cwhite, de/aktivieren
Gui, 5: Add, CheckBox, x20 y25 w12 h12 +BackgroundTrans cwhite vOrgcall Checked%Orgcall%,
Gui, 5: Add, Text, x35 y25 +BackgroundTrans cwhite, Meldet den Backup-call auch im /crew-chat?
Gui, 5: Add, Checkbox, x20 y50 w12 h12 +BackgroundTrans cwhite voldcontracts Checked%oldcontracts% ,
Gui, 5: Add, Text, x35 y50 +BackgroundTrans cwhite, Oldcontracts verwenden?
Gui, 5: Add, Checkbox, x20 y75 w12 h12 +BackgroundTrans cwhite vAktvierenHP Checked%AktvierenHP% ,
Gui, 5: Add, Text, x35 y75 +BackgroundTrans cwhite, Die HP selbst einstellen, wann er Paket/Fische/Drogen used?
Gui, 5: Add, Checkbox, x20 y100 w12 h12 +BackgroundTrans cwite vFeeEinstell Checked%FeeEinstell%
Gui, 5: Add, Text, x35 y100 +BackgroundTrans cwhite, Am Start festlegen wie viel Du Verdienen willst?
Gui, 5: Add, Checkbox, x20 y200 w12 h12 +BackgroundTrans cwhite vAutoMotorAus Checked%AutoMotorAus% ,
Gui, 5: add, Text, x35 y200 +BackgroundTrans cwhite, beim Absteigen den Motor ausschalten?
Gui, 5: add, Checkbox, x20 y225 w12 h12 +BackgroundTrans cwhite vALotto_An Checked%ALotto_An%,
Gui, 5: add, Text, x35 y225 +BackgroundTrans cwhite, Automatisch Lottospielen?
Gui, 5: Add, Checkbox, x20 y250 w12 h12 +BackgroundTrans cwhite  vAlock Checked%Alock%,
Gui, 5: Add, Text, x35 y250 +BackgroundTrans cwhite, Fahrzeug abschlie�en beim Motorstart
Gui, 5: add, Checkbox, x20 y275 w12 h12 +BackgroundTrans cwhite vALight Checked%ALight%,
Gui, 5: Add, Text, x35 y275 +BackgroundTrans cwhite, Fahrzeuglicht einschalten bei Motorstart
Gui, 5: Add, Checkbox, x20 y300 w12 h12 +BackgroundTrans cwhite vXtasteOn Checked%XTasteOn%,
Gui, 5: Add, Text, x35 y300 +BackgroundTrans cwhite, Tank/Zoll per X Taste �ffnen
;Fisch
Gui, 5: Add, GroupBox, x385 y200 w300 h100 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x385 y190 +BackgroundTrans cwhite, Einstellung /Fish
Gui, 5: Add, Text, x400 y225 +BackgroundTrans cwhite, Willst du den Billigsten Fisch, den HP niedrigsten Fisch oder
Gui, 5: Add, Text, x400 y240 +BackgroundTrans cwhite,  keinen Fisch wegschmei�en?
Gui, 5: Add, Text, x400 y255 +BackgroundTrans cwhite, HP = 1 || $ = 2 || Nix = 3
Gui, 5: Add, Edit, x520 y254 w50 h16 vangelType, %angelType%

;Copliste
Gui, 5: Add, GroupBox, x385 y320 w300 h100 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x385 y310 +BackgroundTrans cwhite, Einstellung /cops
Gui, 5: Add, Text, x400 y335 +BackgroundTrans cwhite, Willst Du die Copliste als Dialog oder im Chat?
Gui, 5: Add, Text, x400 y350 +BackgroundTrans cwhite,  keinen Fisch wegschmei�en?
Gui, 5: Add, Text, x400 y365 +BackgroundTrans cwhite, Dialog = 1 || Chat = 2
Gui, 5: Add, Edit, x520 y364 w50 h16 vcoplist, %coplist%

;Festgeld
Gui, 5: Add, Groupbox, x12 y335 w150 h55 +BackgroundTrans cwhite
Gui, 5: Add, Text, x15 y328 +BackgroundTrans cwhite, Festgeld
Gui, 5: Add, Edit, x15 y355 w100 h20 vfg, %fg%



;Buttons
Gui, 5: Add, Button, x400 y450 w80 h30 gSad cwhite, Eigene Werbung  
Gui, 5: Add, Button, x500 y450 w80 h30 gAusruesten cwhite, Ausruesten
Gui, 5: Add, Button, x605 y450 w80 h30 gSave_Einstellungen, Speichern

IF(ALotto_An == 1)
{
Gui, 5: Add, Groupbox, x12 y400  w300 h80 +BackgroundTrans cwhite,
Gui, 5: Add, Text, x12 y392 +BackgroundTrans cwhite, Auto. Lotto
Gui, 5: Add, Text, x20 y420 +BackgroundTrans cwhite, Lotto 0-200 ||  -1 ist Rmd
Gui, 5: Add, Edit, x165 y419 w100 h20 vALotto_Zahl, %ALotto_Zahl%
Gui, 5: Add, Text, x20 y440 +BackgroundTrans cwhite, Ab wv willst du Lotto Spielen?
Gui, 5: Add, Edit, x165 y439 w100 h20 vALotto_Preis, %ALotto_Preis%
}

    
If(FeeEinstell == 1)
{
Gui, 5: Add, GroupBox, x385 y141 w200 h43 +BackgroundTrans, 
Gui, 5: Add, Text, x386 y133 +BackgroundTrans cwhite, Einstellung Verdienst
Gui, 5: Add, Edit, x400 y155 w30 h20 vFeeEinstellung, %FeeEinstellung%
Gui, 5: Add, Text, x432 y157 +BackgroundTrans cwhite, $`tVerdienst pro Wtd
}

	
	
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

Gui, 5: Show, Center h500 w700,Einstellungen
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
GuiControlGet, FeeEinstellung
GuiControlGet, FeeEinstell
GuiControlGet, angelType
GuiControlGet, AutoMotorAus
GuiControlGet, Alotto_An
GuiControlGet, Alotto_Preis
GuiControlGet, Alotto_Zahl
GuiControlGet, Alock
GuiControlGet, ALight
GuiControlGet, coplist
GuiControlGet, fg
GuiControlGet, XTasteOn
GuiControlGet, oldcontracts


IniWrite, %AutoMotorAus%, settings.ini, Einstellung, AutoMotorAus
IniWrite, %angelType%, settings.ini, Einstellung, angelType
IniWrite, %FeeEinstell%, settings.ini, Einstellung, FeeEinstell
IniWrite, %FeeEinstellung%, settings.ini, Einstellung, FeeEinstellung
IniWrite, %Orgcall%, settings.ini, Einstellung, Orgcall
Iniwrite, %Stats%, settings.ini, Einstellung, Stats
IniWrite, %Erstehilfe%, settings.ini, Einstellung, Erstehilfe
Iniwrite, %Drugs%, settings.ini, Einstellung, Drugs
Iniwrite, %Fische%, settings.ini, Einstellung, Fische
IniWrite, %AktvierenHP%, settings.ini, Einstellung, AktvierenHP
IniWrite, %PaketUse%, settings.ini, Einstellung, PaketUse
IniWrite, %DrugsUse%, settings.ini, Einstellung, DrugsUse
IniWrite, %FishUse%, settings.ini, Einstellung, FishUse
IniWrite, %ALotto_An%, settings.ini, Einstellung, ALotto_An
IniWrite, %ALotto_Preis%, settings.ini, Einstellung, ALotto_Preis
IniWrite, %ALotto_Zahl%, settings.ini, Einstellung, ALotto_Zahl
IniWrite, %Alock%, settings.ini, Einstellung, Alock
IniWrite, %ALight%, settings.ini, Einstellung, ALight
IniWrite, %coplist%, settings.ini, Einstellung, Copliste
IniWrite, %fg%, settings.ini, Einstellung, Festgeld
IniWrite, %XTasteOn%, settings.ini, Einstellung, XTasteOn
IniWrite, %oldcontracts%, settings.ini, Einstellung, oldcontracts

MsgBox, 64, Einstellung, Einstellungen gespeichert. Lade Keybinder neu...
Reload
return
;}

Zur�ckstart:
Reload
return

Fest:
Gui, 6:Add, Picture, x0 y0 w770 h290 +BackgroundTrans, %A_ScriptDir%\background.png
Gui, 6: Add, Edit, x6 y7 w730 h220 ReadOnly, %Slashbinds%
Gui, 6: Add, Button, x6 y232 w100 h30 gZur�ckstart, Zur�ck
Gui, 6: Show, Center  h268 w747, Wheelman Keybinder
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

ALotto:
GetChatLine(1, line2)
If(InStr(line2, "Die n�chste Lotto Ziehung beginnt um"))
{
	IF(ALotto_An == 1)
	{	
		If(InStr(line2, "Es befinden sich")){
			RegExMatch(line2, "Es befinden sich (.*)\$ im Jackpot." params)
			Lottogewinn := params1
			IF(ALotto_Preis >= Lottogewinn)
			{
				AddChatMessage("{0E1681}Agency{FFFFFF} | Dr�cke '{FFBF00}X{FFFFFF}' um ein Lotto Ticket zu kaufen")
				KeyWait, X, D, T5
				if !ErrorLevel
				{
					IF(ALotto_Zahl == "-1")
					{
						Random, rand, 1, 200
						SendChat("/lotto " rand)
					}
					else
					{
					SendChat("/lotto " . ALotto_zahl . "")
					}
				}
			}
		}
	}
}
return

XTaste:
IniRead, XTasteOn, settings.ini, Einstellung, XTasteOn
if(XtasteOn == 1)
{
if(IsPlayerInAnyVehicle() && IsPlayerDriver())
{
	if(IsPlayerInRangeOfPoint(614.7936,1689.5481,6.5567, 10) || IsPlayerInRangeOfPoint(-1328.5437,2677.2109,49.6285, 10) || IsPlayerInRangeOfPoint(1595.7455,2198.9319,10.3875, 10) || IsPlayerInRangeOfPoint(2202.3479,2473.9041,10.3849, 10) || IsPlayerInRangeOfPoint(2113.8887,920.1363,10.3840, 10) || IsPlayerInRangeOfPoint(-2408.7478,975.8612,44.8655, 10) || IsPlayerInRangeOfPoint(-2029.3025,156.4132,28.4108, 10) || IsPlayerInRangeOfPoint(-1676.3165,414.2832,6.7490, 10) || IsPlayerInRangeOfPoint(1004.1802,-939.2733,41.7504, 10) || IsPlayerInRangeOfPoint(1944.1013,-1772.9907,12.9622, 10) || IsPlayerInRangeOfPoint(-90.6283,-1169.5378,1.9707, 10) || IsPlayerInRangeOfPoint(-1605.3982,-2714.4424,48.5335, 10) || IsPlayerInRangeOfPoint(-2243.8896,-2560.5569,31.9219, 10) || IsPlayerInRangeOfPoint(1380.9418,457.1429,19.4861, 10) || IsPlayerInRangeOfPoint(70.4341,1218.6842,18.3743, 10) || IsPlayerInRangeOfPoint(1555.4310,-1605.5901,13.1827, 10))
	{
		AddChatMessage(" |{01DF01}Wheelman{FFFFFF}| Du kannst jetzt dein Fahrzeug betanken. Dr�ck '{FFBF00}X{FFFFFF}' zum best�tigen.")
		KeyWait, X, D, T10
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
		AddChatMessage("{0E1681}Agency{FFFFFF} | M�chtest du den Zoll jetzt �ffnen? Zum �ffnen '{FFBF00}X{FFFFFF}' dr�cken.")
		Settimer, XTaste, off
		KeyWait, X, D, T10
		if !ErrorLevel
		{
			Settimer, XTaste, 500
			SendChat("/zoll")
			GetChatLine(0, chat)
			if(InStr(chat, "Es ist keine Zo l Station in deiner N�he"))
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
		AddChatMessage("{0E1681}Agency{FFFFFF} | M�chtest du dir Drogen kaufen? Zum kaufen '{FFBF00}X{FFFFFF}' dr�cken.")
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
}
return


fee:
GetChatLine(1, line2)
if(InStr(line2, "Du hast deinen heutigen Aktivit�tsbonus"))
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
			
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
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
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
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast bereits " result_2 " Wanteds gehackt und bereits " resultm_2 "$ verdient.")
			
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
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("{0E1681}Agency{FFFFFF} | Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result2 " (Result2) ~~ " resulti2 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		} else {
			AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler: " result_2 " (Result_2) ~~ " resultm_2	" (Resultm_2) ~~ Bitte an John_Reese wenden")
		}
	}
}
return

Show:
SendChat("/showpos " . AID)
return

GK:
GetChatLine(0, Chatline)
if(InStr(Chatline, "Der Spieler befindet sich in") && InStr(Chatline, "Geb�udekomplex"))
{
	RegExMatch(Chatline, "Der Spieler befindet sich in Geb�udekomplex (.*)", params) 
	GKID := params1
	gk_search(GKID)
}
return
 
Find:
SendChat("/find " . AID)
return


antiSpam:
if(!WinActive("GTA:SA:MP"))
	return
GetChatLine(0, Chatline__)
GetChatLine(1, Chatline_)
Chatline := Chatline_ Chatline__
if(InStr(Chatline, "WARNUNG: H�r auf zu Spamen, sonst wirst du gekickt!")){
	if(InStr(Chatline, "sagt:") || InStr(Chatline, "schreit:") || InStr(Chatline, "**(("))
		return
	BlockChatInput()
	AddChatMessage("{0E1681}Agency{FFFFFF} |Anti-Spam Schutz aktiviert.")
	sleep, 3000
	AddChatMessage("{0E1681}Agency{FFFFFF} |Anti-Spam Schutz deaktiviert.")
	unblockChatInput()
}
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
	if(InStr(line1, "Du bist nicht in der N�he des Spielers"))
	{
		return
	}	
    Sleep 1000
    ShowGameText("~g~4 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der N�he des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~3 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der N�he des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~2 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der N�he des Spielers"))
	{
		return
	}
    Sleep 1000
    ShowGameText("~g~1 ~g~", 1000, 3)
}
GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der N�he des Spielers"))
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast schon " FormatNumber(result2) " Personen befreit und " FormatNumber(resultm_2) "$ verdient.")
			
			url = http://wheelman.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = http://wheelman.jameschans.de/keybinder/dm/dausge.php?name=%username%
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			AddChatMessage("{0E1681}Agency{FFFFFF} | Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
			AddChatMessage("{0E1681}Agency{FFFFFF} | Wochengrabs: " resulti2 " - Monatsgrabs: " resulti3)
		} else {
			AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler. Bitte an Pietro_Miller oder John_Reese wenden.")
		}
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
if(InStr(Line1, "<< Hitman " username " hat den Auftrag ausgef�hrt und"))
{
	RegExMatch(Line1, "<< Hitman " username " hat den Auftrag ausgef�hrt und (.*) f�r (.+)\$ get�tet. >>", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgef�hrt und"))
{
	
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgef�hrt und (.*) f�r (.+)\$ get�tet. >>", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
return

FischTimer:
AddChatMessage("Du kannst nun wieder zum Angeln gehen!")
Settimer, Fischtimer, OFf
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
	AddChatMessage("{0E1681}Agency{FFFFFF} | Du bist in keinem Fahrzeug")
}
else
{
    If(IsPlayerDriver() == 0)
    {
		AddChatMessage("{0E1681}Agency{FFFFFF} | Du bist nicht der Fahrer eines Fahrzeuges.")
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
        AddChatMessage("{0E1681}Agency{FFFFFF} | Du befindest dich in keinem Fahrzeug.")
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
		AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . FishUse . " HP{FFFFFF} Fische essen.")
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
	AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast alle Fische Verbraucht.")
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . DrugsUse . " HP{FFFFFF} deine Drogen benutzen.")
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
			AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . PaketUse . " HP{FFFFFF} dein Erstehilfe Paket benutzen.")
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
		SendChat("/F BK! In: " zone ", " City " | ID: " . getId() . " | HP: " . GetPlayerHealth() . "") 
		if(OrgCall == 1)
		{
			SendChat("/crew BK! In: " zone ", " City " | ID: " . getId() . " | HP: " . GetPlayerHealth() . "") 
		}
return

;Bkend
HotKey9:
if(IsInChat())
	return
SendChat("/f Verst�rkung wird NICHT mehr ben�tigt!")
backup := 0
if(OrgCall == 1)
{
    SendChat("/crew Verst�rkung wird NICHT mehr ben�tigt!")
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

HotKey11:
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




Hotkey12:
if(IsInChat())
	return
SendChat("/buykit")
return

Hotkey13:
if(isInChat())
	return
if(getVehicleHealth() > 1000)
{
AddChatMessage("{0E1681}Agency{FFFFFF} | Erst ab 99% kann man das Kit Usen!")
return
} 
else
{
	SendChat("/usekit")
}
return


Hotkey14:
if(IsInChat())
	return
SendChat("/mask")
return







;PosF
HotKey15:
if(IsInChat())
	return
 SendChat("/F Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;PosOrg
HotKey16:
if(IsInChat())
	return
SendChat("/crew Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;Letzter Befehl
HotKey17:
if(IsInChat())
	return
SendInput t{up}{enter}
return

;Keybinder Pausieren
HotKey18:
if(IsInChat())
	return
SetTimer, Find, Off
SetTimer, Show, Off
SetTimer, GK, Off
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Automatisches Findsystem deaktiviert.") 
return

;Hacken
HotKey19:
if(IsInChat())
	return
SendChat("/hacken")
return

;Accept Wheelman
HotKey20:
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
		AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast bereits " FormatNumber(result_2) " Auftr�ge angenommen")
		url := ""
		result := ""
		url = http://wheelman.jameschans.de/keybinder/dm/dangen.php?name=%username%
		URLDownloadToVar(url, result)
		StringSplit, result, result, ~
		AddChatMessage("{0E1681}Agency{FFFFFF} | Wochenauftr�ge: " FormatNumber(result2) " - Monatsauftr�ge: " FormatNumber(result3))
	} else {
		AddChatMessage("{0E1681}Agency{FFFFFF} | Datenbankfehler. Bitte an John_Reese oder Pietro_Miller wenden.")
	}
}
return


;Whzur�cklegen
HotKey21:
if(IsInChat())
	return
SendChat("/revert")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Sie haben den Wheelmanauftrag zur�ckgelgt.")
return

;CancelWheelman
HotKey22:
if(IsInChat())
	return
SendChat("/cancel wheelman")
return


HotKey23:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil1_1 . " " . Profil1_2 . " " . Profil1_3 . " " . Profil1_4 . " " . Profil1_5 . " " . Profil1_6 . " " . Profil1_7 . " " . Profil1_8 . " " . Profil1_9 . " " . Profil1_10 . "")
Sleep, 500
SendChat("/heal")
return


HotKey24:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil2_1 . " " . Profil2_2 . " " . Profil2_3 . " " . Profil2_4 . " " . Profil2_5 . " " . Profil2_6 . " " . Profil2_7 . "")
Sleep, 500
SendChat("/heal")
return


/*
Hotkey24:
if(IsInChat())
	return
SendChat("/mask")
return
*/


Hotkey25:
if(IsInChat())
	return
SendChat("/hram")
return

Hotkey26:
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

:?:/oc::
:?:/offlinecontract::
{
    labelText := getLabelText()
    if (RegExMatch(labelText, "(\S+)\n\((\S+)\)\n(\d+):(\d+):(\d+)", labelText_)) {
        SendChat("/offlinecontract "  labelText_1)
    } else {
        SendInput, /offlinecontract 
    }
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgef�hrt und (.*) f�r (.+)\$ get�tet (offlinearrest)")){
RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgef�hrt und (.*) f�r (.+)\$ get�tet ", regex_)
contracting := -1
contractupload(username, regex_2)
}
}
return

:?:/dc::
:?:/deathcontract::
{
    labelText := getLabelText()
    if (RegExMatch(labelText, "(\S+)\n\((\S+)\)\n(\d+):(\d+):(\d+)", labelText_)) {
        SendChat("/deathcontract "  labelText_1)
    } else {
        SendInput, /deathcontract{space}
    }
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgef�hrt und ")){
contractupload(username, regex_2)
}
}
return



Hotkey27:
if(IsInChat())
	return
SendChat("/auf")
return

Hotkey28:
if(IsInChat())
	return
SendChat("/hide")
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
printHotkey(34)
return
HotKey35:
printHotkey(35)
return
HotKey36:
printHotkey(36)
return
HotKey37:
printHotkey(37)
return
HotKey38:
printHotkey(38)
return

/*
:?:/ej::
Suspend Permit
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
*/




~e & ~1::
psg := GetSeatIDs()
if(IsInChat())
	return
if(psg[2] != -1)
{	
SendChat("/eject "psg[2])
}
return

~e & ~2::
psg := GetSeatIDs()
if(IsInChat())
	return
if(psg[3] != -1)
{
SendChat("/eject "psg[3])
}
return

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
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| {F0F0F0}Keybinder {B40404}deaktiviert{F0F0F0}.")
ShowGameText("~r~Keybinder ~r~ deaktiviert", 2000, 3)
paused = 1
Suspend permit
}
if (!A_IsSuspended)
{
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| {F0F0F0}Keybinder {088A4B}aktiviert{F0F0F0}.")
ShowGameText("~g~Keybinder ~g~ aktiviert", 2000, 3)
paused = 0
Suspend off
}
        return

:?:/tr::
Suspend Permit

Zahl1 := PlayerInput("Zahl 1: ")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Es gibt folgende Aktionen: + - * /") 
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
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Das Ergebnis lautet: {01DF01}" . calcresult . "")
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
		RegExMatch(Chatline, "Du hast deinen (.*) \((.*) LBS\) f�r (.*)\$ verkauft\.", var)
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
AddChatMessage("{0E1681}Agency{FFFFFF} | Der Keybinder wirft nun bei '/fish || /afish' keinen Fisch weg")
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
						}else if(fishes_var2 == "Blauer F�cherfisch"){
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
						}else if(fishes_var2 == "Schildkr�te"){
							moneyGesamt += Floor(fishes_var3 * 10)
						}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
							moneyGesamt += Floor(fishes_var3 * 12)
						}else{
							AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
							AddChatMessage("Es w�re nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken k�nntest")
							AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
							AddChatMessage(" Vielen Dank!")
							continue
						}
						healthGesamt += Floor(fishes_var3 * 0.3)
					}
					
					AddChatMessage("Die Fische w�rden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
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
					}else if(fishes_var2 == "Blauer F�cherfisch"){
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
					}else if(fishes_var2 == "Schildkr�te"){
						moneyGesamt += Floor(fishes_var3 * 10)
					}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
						moneyGesamt += Floor(fishes_var3 * 12)
					}else{
						AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
						AddChatMessage("Es w�re nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken k�nntest")
						AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
						AddChatMessage(" Vielen Dank!")
						continue
					}
					healthGesamt += Floor(fishes_var3 * 0.3)
				}
				AddChatMessage("Die Fische w�rden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
				return
			}
		}
		sleep, 800
	}
} else {
	SendChat("/fish")
}
return

:?:/whstats::
username := GetUsername()
url = http://wheelman.jameschans.de/keybinder/stats.php?name=%username%
URLDownloadToVar(url, result)
StringSplit, result_, result, ~
AddChatMessage("{0E1681}Agency{FFFFFF} | Deine Wheelman Statistiken")
AddChatMessage("{0E1681}Agency{FFFFFF} | Angenommen`t`tAusgef�hrt`t`tGehackt`t`tEinnahmen:")
AddChatMessage("{0E1681}Agency{FFFFFF} | " FormatNumber(result_1) "`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_2) "`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_3) "`t`t`t`t`t`t`t`t`t`t`t`t" FormatNumber(result_4) "$")
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
	}else if(fishes_var2 == "Blauer F�cherfisch"){
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
	}else if(fishes_var2 == "Schildkr�te"){
		moneyGesamt += Floor(fishes_var3 * 10)
	}else if(fishes_var2 == "Thunfisch" || fishes_var2 == "Wolfbarsch"){
		moneyGesamt += Floor(fishes_var3 * 12)
	}else{
		AddChatMessage(fishes_var2 . " (" . fishes_var3 . " LBS) ist ein unbekannter Fisch und konnte nicht berechnet werden.")
		AddChatMessage("Es w�re nett von dir, wenn du dir den Verkaufspreis, den Namen und die LBS des Fisches merken k�nntest")
		AddChatMessage("und diese Daten Im CP unter'Bug Melden' posten.")
		AddChatMessage(" Vielen Dank!")
		continue
	}
	healthGesamt += Floor(fishes_var3 * 0.3)
}
AddChatMessage("Die Fische w�rden dir ingesamt " . healthGesamt . "HP oder " . moneyGesamt . "$ bringen.")
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
SendChat("Was kann ich f�r Sie tun?")
return

:?:/h::
SendChat("Vielen Dank f�r Ihren Anruf.")
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
                        AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Versendung nicht m�glich!")
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
AddChatMessage("{0E1681}Agency{FFFFFF} | Gib eine Zahl f�r deinen Countdown ein")
zahl := PlayerInput("/Countdown: ")
AddChatMessage("{0E1681}Agency{FFFFFF} | Du kannst den Countdown mit '{FFBF00}<{FFFFFF}' beenden.")
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
	AddChatMessage("{0E1681}Agency{FFFFFF} |" . fisch%A_Index%_1 . " (" . fisch%A_Index%_2 . " LBS) - {FFA000} " . HP%A_Index% . " HP")
}

AddChatMessage( "|{01DF01}Wheelman{FFFFFF}|Die Fische bringen dir Gesamt: {FFA000}" . HP . " HP")
return



:?:/min::
Suspend Permit
Sekunden := PlayerInput("Anzahl der Sekunden: ")
if(Sekunden != "" && Sekunden != " " && Sekunden != 0)
{
        Minuten := Sekunden / 60
        Minuten := round(Minuten, 2)
        AddChatMessage( "|{01DF01}Wheelman{FFFFFF}|{3ADF00}" Sekunden "{FFFFFF} Sekunden sind {3ADF00}" Minuten "{FFFFFF} Minuten.")
}
return
/*
if(isInChat())
	return
Suspend Permit
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


*/
:?:t/tu1::
psg := GetSeatIDs()
Suspend Permit
if(psg[2] != -1)
{	
SendChat("/tie "psg[2])
SendChat("/untie "psg[2])
}
return

:?:t/tu2::
psg := GetSeatIDs()
Suspend Permit
if(psg[3] != -1)
{
SendChat("/tie "psg[3])
SendChat("/untie "psg[3])
}
return

:?:t/tu3::
psg := GetSeatIDs()
Suspend Permit
if(psg[4] != -1)
{
SendChat("/tie "psg[4])
SendChat("/untie "psg[4])
}
return


:?:t/ut1::
psg := GetSeatIDs()
Suspend Permit
if(psg[2] != -1)
{
SendChat("/untie "psg[2])	
SendChat("/tie "psg[2])
}
return

:?:t/ut2::
psg := GetSeatIDs()
Suspend Permit
if(psg[3] != -1)
{
SendChat("/untie "psg[3])
SendChat("/tie "psg[3])
}
return

:?:t/ut3::
psg := GetSeatIDs()
Suspend Permit
if(psg[4] != -1)
{
SendChat("/untie "psg[4])
SendChat("/tie "psg[4])
}
return


:?:t/tu::
psg := GetSeatIDs()
Suspend Permit
if(psg[2] != -1)
{	
SendChat("/tie "psg[2])
SendChat("/untie "psg[2])
}
sleep 500
if(psg[3] != -1)
{
SendChat("/tie "psg[3])
SendChat("/untie "psg[3])
}
sleep 500
if(psg[4] != -1)
{
SendChat("/tie "psg[4])
SendChat("/untie "psg[4])
}
return

:?:t/ut::
psg := GetSeatIDs()
Suspend Permit
if(psg[2] != -1)
{
SendChat("/untie "psg[2])	
SendChat("/tie "psg[2])
}
sleep 500
if(psg[3] != -1)
{
SendChat("/untie "psg[3])
SendChat("/tie "psg[3])
}
sleep 500
if(psg[4] != -1)
{
SendChat("/untie "psg[4])
SendChat("/tie "psg[4])
}
return
 
 

:?:/tro::
Suspend Permit 
SendChat("/trunk open")
return

:?:/trpm::
Suspend Permit
anzahlmats := Playerinput("Mats anzahl: ")
SendChat("/trunk put mats "anzahlmats)
return

:?:/trpd::
Suspend Permit
anzahldrogen := Playerinput("Drogen anzahl: ")
SendChat("/trunk put drugs "anzahlmats)
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
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Du hast alle Waffen f�r {FF0000}" . GesamtGeld . "{FFFFFF}$ ausger�stet.")
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



:?:/cc::
:?:/clear::
:?:/chatclear::
Suspend Permit
Loop 300
{
  AddChatMessage( " ")
}
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Chatclear abgeschlossen")
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
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Das automatische Suchen k�nnen Sie mit der eingestellten Taste deaktivieren.")
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
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Das automatische Suchen k�nnen Sie mit der eingestellten Taste deaktivieren.")
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;KIDNAP

:?:/kidhelp::
Suspend Permit
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| /fahrer - Damit legst du fest, wer der Fahrer ist.") 
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| /opfer - Mit diesem Befehl legst du fest, wer dein Opfer ist.") 
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| /sitz - Dies ist der Sitzplatz im Auto, wo das Opfer hingezogen wird.")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| # um das ganze Auszuf�hren")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| /kidinfo - zeigt die aktuelle Aufstellung anzeigen")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| /retie - Das Opfer erneut tien")
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| < - Beendet /retie Timer")
return



:?:t/opfer::
opfer := PlayerInput("/Opfer-ID: ")
IniWrite, %opfer%, settings.ini, Kidnap, Opfer
name := GetPlayerNameByID(opfer)
AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast " name " (ID: " opfer ") als Opfer eingetragen")
return

:?:t/fahrer::
fahrer := PlayerInput("/Fahrer-ID: ")
IniWrite, %fahrer%, settings.ini, Kidnap, Fahrer
name := GetPlayerNameByID(fahrer)
AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast " name " (ID: " fahrer ") als Fahrer eingetragen")
return

:?:t/sitz::
sitz := PlayerInput("/Sitz-ID: ")
IniWrite, %sitz%, settings.ini, Kidnap, Sitz
AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast den Sitzplatz " sitz " eingetragen")
return

~<::
if(IsInChat())
	return
Settimer, kidnaptimer2, Off
AddChatMessage("{0E1681}Agency{FFFFFF} |Entf�hrungstimer beendet.")
return



~#::
if(IsInChat())
	return
IniRead, Fahrer, settings.ini, Kidnap, Fahrer, -1
IniRead, Opfer, settings.ini, Kidnap, Opfer, -1
IniRead, Sitz, settings.ini, Kidnap, Sitz, -1
if(Fahrer == -1 || Opfer == -1 || Sitz == -1)
	return
AddChatMessage( "|{01DF01}Wheelman{FFFFFF}| Entf�hrung ist im Gange...")
SendChat("/kidnap " . Opfer . " " . Fahrer . " " . Sitz . "")

SetTimer, Kidnapcd, on
Settimer, kidnaptimer, on
return

/*
* Du versuchst Sandro_Santiago ins Farzeug zu ziehen.
* Pietro_Miller hat Sandro_Santiago in das Fahrzeug gezogen.
Der Spieler ist nicht in der n�he
*/

Kidnapcd:
GetChatLine(0, line1)
if(InStr(line1,"* Du versuchst") && InStr(line1, "ins Farzeug zu ziehen"))
{
	ShowGameText("~g~3 ~g~", 1000, 3)
	Sleep 1000
	ShowGameText("~g~2 ~g~", 1000, 3)
	Sleep 1000
	ShowGameText("~g~1 ~g~", 1000, 3)
	Sleep 1000
	ShowGameText("~g~0 ~g~", 1000, 3)
	SetTimer, Kidnapcd, Off
}
return

kidnaptimer:
GetChatLine(0, line1)
if(InStr(line1, "in das Fahrzeug gezogen"))
{
	timer := 10
	Settimer, kidnaptimer, off
	Settimer, kidnaptimer2, on
}
if(InStr(line1, "Der Spieler ist nicht in der")){
	AddChatMessage("{0E1681}Agency{FFFFFF} | Abgebrochen")
	Settimer, kidnaptimer, off
}
return

kidnaptimer2:
Settimer, kidnaptimer2, 60000
timer--
if(timer == 1)
{
	AddChatMessage("Du hast nur noch eine Minute bevor er sich befreien kann!")
	AddChatMessage("Tippe /retie ein, um die Person erneut zu tien.")
	Settimer, kidnaptimer2, off
} else {
	AddChatMessage("Du hast noch " timer " Minuten, bevor er sich befreien kann")
}
return

:?:/retie::
Suspend permit
Settimer, kidnaptimer2, off
IniRead, Opfer, settings.ini, Kidnap, Opfer
if(Opfer == -1)
	return
SendChat("/untie " Opfer)
SendChat("/tie " Opfer)
timer := 10
Settimer, kidnaptimer2, 1000
return

:?:/kidinfo::
Suspend, Permit
IniRead, Fahrer, settings.ini, Kidnap, Fahrer
IniRead, Opfer, settings.ini, Kidnap, Opfer
IniRead, Sitz, settings.ini, Kidnap, Sitz
if(Fahrer == -1){
	AddChatMessage("{FFFFFF}Der Fahrer wurde nicht eingetragen")
	return
}
if(Opfer == -1){
	AddChatMessage("{FFFFFF}Das Opfer wurde nicht eingetragen")
	return
}
if(Sitz == -1){
	AddChatMessage("{FFFFFF}Der Sitz wurde nicht eingetragen")
	return
}
AddChatMessage("{FFFFFF}Partner: {FF0000}" . Fahrer . "{FFFFFF} || Kunde: {FF0000}" . Opfer . "{FFFFFF} || Sitz-Nummer: {FF0000}" . Sitz . "")
return





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Vorr�bergehende Copliste

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
	AddChatMessage("{0E1681}Agency{FFFFFF} | Es sind " copscount " Cops online")
} else if(copscount == 0){
	AddChatMessage("{0E1681}Agency{FFFFFF} | Es sind 0 Cops online")
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
	AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast den Cop " cname " hinzugef�gt")
} else {
	AddChatMessage("{0E1681}Agency{FFFFFF} | Fehler: " result)
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
	AddChatMessage("{0E1681}Agency{FFFFFF} | Du hast den Cop " cname " gel�scht")
}  else {
	AddChatMessage("{0E1681}Agency{FFFFFF} | Fehler: " result)
}
return

:?:/relog::
AddChatMessage("{0E1681}Agency{FFFFFF} | Du verbindest nun neu...")
restart()
return

;~ Scripte

contractupload(username, geld){
	url = http://wheelman.jameschans.de/keybinder/contract.php?name=%username%
	urli = http://wheelman.jameschans.de/keybinder/dm/dcontract.php?name=%username%
	URLDownloadToVar(url, result1)
	URLDownloadToVar(urli, result2)
	StringSplit, output1_, result1, ~
	StringSplit, output2_, result2, ~
	IniWrite, -1, settings.ini, Zielperson, contract
	if(output1_1 == 1){
	AddChatMessage("{0E1681}Agency{FFFFFF} | Ausgef�hrte Contracts: " FormatNumber(output1_2) "")
	} else {
		AddChatMessage(output1_1)
		AddChatMessage(output1_2)
		AddChatMessage("Datenbankfehler" output1_2 " ~~ Bitte an John_Reese wenden")
	}
	if(output2_1 == 1)
	{
		AddChatMessage("{0E1681}Agency{FFFFFF} | Ausgef�hrte Contracts ( Monat ): " FormatNumber(output2_4) "")
		AddChatMessage("{0E1681}Agency{FFFFFF} | Ausgef�hrte Contracts ( Woche ): " FormatNumber(output2_2) "")
	} else {
		AddChatMessage(output2_1)
		AddChatMessage(output2_2)
		AddChatMessage("Datenbankfehler " output2_2 " ~~ Bitte an John_Reese wenden")
	}	
	
}


printHotkey(id) 
{
	if(IsInChat())
		return
	IniRead, command, Hotkeys.ini, Command, CMD%id%
	
	if(command == "[HEAL]") 
	{
		if(GetPlayerHealth() >= 100)
		{
			AddChatMessage("Du hast es nicht n�tig, dich zu healen!")
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
	else if(FishName == "Schildkr�te")
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
	else if(FishName == "Blauer F�cherfisch")
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
	}else if(fish == "Blauer F�cherfisch"){
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
	}else if(fish == "Schildkr�te"){
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
AddChatMessage("Deine Angabe ist ung�ltig")
return
}
URLDownloadToVar("http://samp.lennartf.com/gkapi/query/" regex_1 "/" regex_2 "", res)
if(!InStr(res, "success"))
{
AddChatMessage("Die vom Server erhaltenen Daten sind fehlerhaft. Versuche es (sp�ter) erneut")
return
}
AddChatMessage("{FFFFFF}Es wurden folgende Geb�udekomplexe unter {0077FF}" gk "{FFFFFF} gefunden:")
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
IniWrite, -1, settings.ini, Kidnap, Fahrer
IniWrite, -1, settings.ini, Kidnap, Opfer
IniWrite, -1, settings.ini, Kidnap, Sitz


ExitApp
return




