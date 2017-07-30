#Include API.ahk
#include inc\ImageButton.ahk
#ifWinActive, GTA:SA:MP
#SingleInstance, force
#Persistent
#UseHook
#NoEnv



Menu, Tray, NoStandard
Menu, Tray, Add , Schließen, GuiClose

ifExist, updater.exe
        FileDelete, updater.exe
		
IfNotExist, src/
{
	FileCreateDir, src
	FileCreateDir, src/gui
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_ausruesten.png, src/gui/button_ausruesten.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_cp.png, src/gui/button_cp.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_einstellungen.png, src/gui/button_einstellungen.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_exit.png, src/gui/button_exit.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_hotkeys.png, src/gui/button_hotkeys.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_hotkeys2.png, src/gui/button_hotkeys2.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_kurzbefehle.png, src/gui/button_kurzbefehle.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_minimize.png, src/gui/button_minimize.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_rpg-city.png, src/gui/button_rpg-city.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_speichern.png, src/gui/button_speichern.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_updatelog.png, src/gui/button_updatelog.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/pic1.jpg, src/gui/pic1.jpg
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/trans60.png, src/gui/trans60.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/trans80.png, src/gui/trans80.png
	
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_ausruesten_hot.png, src/gui/button_ausruesten_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_cp_hot.png, src/gui/button_cp_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_einstellungen_hot.png, src/gui/button_einstellungen_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_exit_hot.png, src/gui/button_exit_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_hotkeys_hot.png, src/gui/button_hotkeys_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_hotkeys2_hot.png, src/gui/button_hotkeys2_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_kurzbefehle_hot.png, src/gui/button_kurzbefehle_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_minimize_hot.png, src/gui/button_minimize_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_rpg-city_hot.png, src/gui/button_rpg-city_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_speichern_hot.png, src/gui/button_speichern_hot.png
	URLDownloadToFile, https://agency.jameschans.de/keybinder/src/gui/button_updatelog_hot.png, src/gui/button_updatelog_hot.png
}


keybinderVersion = 1.0.2b
global username := GetUsername()

if(username == "")
{
RegRead, username, HKCU, Software\SAMP, PlayerName
}
url = https://agency.jameschans.de/keybinder/check.php?name=%username%
UrlDownloadtoVar(url, result)
StringSplit, result, result, ~
errors2(result1)
if(result1 == 1)
{
	VarSetCapacity(url, ERROR)
	VarSetCapacity(result, ERROR)
}


urli = https://agency.jameschans.de/download/version.txt
URLDownloadToVar(urli, result_)
if(result_ > keybinderVersion)
{
        MsgBox, 68, Update verfügbar, Lieber Benutzer,`nes ist ein neues Update für den Keybinder verfügbar ( Version %result_% ).`nMöchtest Du nun updaten?
        IfMsgBox, Yes
        {
                MsgBox, 68, Update wird heruntergeladen!, Das Update wird nun heruntergeladen, 3
                URLDownloadToFile, https://agency.jameschans.de/keybinder/updater.exe, updater.exe
                MsgBox, 68, Updater start, Der Updater wird nun gestartet und der Keybinder geschlossen., 3
                run, updater.exe
                ExitApp
        }
}

Settimer, hacken, 150
SetTimer, Timer, 1000
SetTimer, Grabben, On
SetTimer, fee, 1000
SetTimer, XTaste, 1000
SetTimer, antiSpam, On
Settimer, clearvariable, 2600
Settimer, contracts, 1000

global BT1, BT2, BT3, BT4, BT5, BT6, BT7, BT8, BT9, BT10, BT11, BT12 := -1
global HBT1, HBT2, HBT3, HBT4, HBT5, HBT6, HBT7, HBT8, HBT9, HBT10, HBT11, HBT12 := -1
global madeBy := -1
global activeFunction := false

Loop, 35
{
	IniRead, CMD%A_Index%, Hotkeys.ini, Command, CMD%A_Index%, %A_Space%
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	
	if(HK%A_Index% != "Keine")
        Hotkey, % HK%A_Index%, HotKey%A_Index%, On
} ; Oben ins Script

loadIni()

; GUI erstellen
GoSub, Startseite




MoveGui:
PostMessage, 0xA1, 2,,, A
return

; Keybinder minimieren, wenn der Button gedrückt wurde
MinimizeGui:
Gui, Minimize
return

; Keybinder beenden, wenn der Button gedrückt wurde
GuiClose:
Gui, Destroy
IniWrite, -1, settings.ini, Kidnap, Fahrer
IniWrite, -1, settings.ini, Kidnap, Opfer
IniWrite, -1, settings.ini, Kidnap, Sitz
unblockChatInput()
ExitApp
return

; Agency CP öffnen
CP:
Run, https://agency.jameschans.de/
return


Einstellungen:
GuiMain(2)



Gui, Add, Picture, x30 y60 w660 h500 vBG1 +BackgroundTrans, src/gui/trans60.png

Gui, Add, GroupBox, x45 y65 w500 h180 +BackgroundTrans ,
Gui, Add, Text, x60 y75 +BackgroundTrans , de/aktivieren

Gui, Add, CheckBox, x60 y90 w12 h12 +BackgroundTrans  vOrgcall Checked%Orgcall%,
Gui, Add, Text, x100 y90 +BackgroundTrans , Meldet den Backup-call auch im /crew-chat?

Gui, Add, Checkbox, x60 y115 w12 h12 +BackgroundTrans  gAktivierenHP vAktvierenHP Checked%activateHP% ,
Gui, Add, Text, x100 y115 +BackgroundTrans , Die HP selbst einstellen, wann er Paket/Fische/Drogen used?

Gui, Add, Checkbox, x60 y140 w12 h12 +BackgroundTrans  vAutoMotorAus Checked%AutoMotorAus% ,
Gui, add, Text, x100 y140 +BackgroundTrans , beim Absteigen den Motor ausschalten?

Gui, Add, Checkbox, x60 y165 w12 h12 +BackgroundTrans   vAlock Checked%Alock%,
Gui, Add, Text, x100 y165 +BackgroundTrans , Fahrzeug abschließen beim Motorstart

Gui, add, Checkbox, x60 y190 w12 h12 +BackgroundTrans  vALight Checked%ALight%,
Gui, Add, Text, x100 y190 +BackgroundTrans , Fahrzeuglicht einschalten bei Motorstart
;Fisch
Gui, Add, GroupBox, x45 y250 w500 h100 +BackgroundTrans ,
Gui, Add, Text, x50 y260 +BackgroundTrans , Einstellung /Fish
Gui, Add, Text, x50 y280 +BackgroundTrans , Billigsten Fisch, HP niedrigsten Fisch oder keinen Fisch wegschmeißen?
Gui, Add, Text, x150 y300 +BackgroundTrans ,HP = 1 || $ = 2 || Nix = 3




Gui, Add, Groupbox, x45 y350 w300 h115 vHPGroupbox +BackgroundTrans, 
Gui, Add, Text, x55 y360 +BackgroundTrans  vHPText, Einstellung HP 


Gui, Add, Text, x110 y380 +BackgroundTrans  vHPPaket, HP Erstehilfe Paket
Gui, Add, Text, x110 y410 +BackgroundTrans  vHPDrogen, HP Drogen
Gui, Add, Text, x110 y440 +BackgroundTrans  vHPFische, HP Fische

Gui, Font, cBlack
Gui, Add, Edit, x60 y380 w40 h20 vPaketUse, %PaketUse%
Gui, Add, Edit, x60 y410 w40 h20 vDrugsUse, %DrugsUse%
Gui, Add, Edit, x60 y440 w40 h20 vFishUse, %FishUse%
Gui, Add, Edit, x50 y300 w100 h16 vangelType, %angelType%

toggleHPSettings(activateHP)

GuiShow()
return

AktivierenHP:
GuiControlGet, checked,, %A_GuiControl%
toggleHPSettings(checked)
return

toggleHPSettings(checked)
{
	if(checked)
	{
		GuiControl, Show, HPGroupbox
		GuiControl, Show, HPText
		GuiControl, Show, PaketUse
		GuiControl, Show, DrugsUse
		GuiControl, Show, FishUse
		GuiControl, Show, HPPaket
		GuiControl, Show, HPDrogen
		GuiControl, Show, HPFische
	}
	else
	{
		GuiControl, Hide, HPGroupbox
		GuiControl, Hide, HPText
		GuiControl, Hide, PaketUse
		GuiControl, Hide, DrugsUse
		GuiControl, Hide, FishUse
		GuiControl, Hide, HPPaket
		GuiControl, Hide, HPDrogen
		GuiControl, Hide, HPFische
	}
}

;{
Hot:
Gui, Add, Edit, x0 y0 w0 h0 +ReadOnly,
GuiMain(1)
Gui, Add, Picture, x30 y70 w260 h500 vBG1 +BackgroundTrans, src/gui/trans60.png
Loop, 35
{
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	StringReplace, HK%A_Index%, HK%A_Index%, ~,,
}

; = Spalte 1
y := 75
Loop, 12
{
	Gui, Add, Hotkey, x35 y%y% w90 h20 vHK%A_Index% gLabel, % HK%A_Index%
	y += 40
}
Gui, Add, text, x142 y75 +BackGroundTrans , Motor An/Aus
Gui, Add, text, x142 y115 +BackGroundTrans , Fahrzeug Abschließen
Gui, Add, text, x142 y155 +BackGroundTrans , Members
Gui, Add, text, x142 y195 +BackGroundTrans , Crewmembers
Gui, Add, text, x142 y235 +BackGroundTrans , Fisch Essen (1-5)
Gui, Add, text, x142 y275 +BackGroundTrans , usedrugs 
Gui, Add, text, x142 y315 +BackGroundTrans , Erstehilfe 
Gui, Add, text, x142 y355 +BackGroundTrans , Call Backup
Gui, Add, text, x142 y395 +BackGroundTrans , Cancel Backup
Gui, Add, text, x142 y435 +BackGroundTrans , Help Backup
Gui, Add, text, x142 y475 +BackGroundTrans , Ejected alle im Car
Gui, Add, text, x142 y515 +BackGroundTrans , Position Im F-Chat

; Spalte 2
Gui, Add, Picture, x305 y70 w350 h520 vBG2 +BackgroundTrans, src/gui/trans60.png
cmdcount := 13
y := 75
Loop, 13
{
	Gui, Add, Hotkey, x312 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	y += 40
	cmdcount++
}
Gui, Add, text, x422 y80 +BackGroundTrans , Position im Org-Chat
Gui, Add, text, x422 y120 +BackGroundTrans , Letzten Befehl Wiederholen
Gui, Add, text, x422 y160 +BackGroundTrans , Auto. Findystem deaktivieren
Gui, Add, text, x422 y200 +BackGroundTrans , Hackvorgang Starten
Gui, Add, text, x422 y240 +BackGroundTrans , Accept Wheelman
Gui, Add, text, x422 y280 +BackGroundTrans , Revert Auftrag
Gui, Add, text, x422 y320 +BackGroundTrans , Cancel Wheelman
Gui, Add, text, x422 y360 +BackGroundTrans , Ausruesten(V1)
Gui, Add, text, x422 y400 +BackGroundTrans , Ausruesten(V2)
Gui, Add, text, x422 y440 +BackGroundTrans , Maske aufsetzen
Gui, Add, text, x422 y480 +BackGroundTrans , /oldcontracts
Gui, Add, text, x422 y520 +BackGroundTrans , /hram
Gui, Add, text, x422 y560 +BackGroundTrans , Contractsystem


GuiShow()
return

Hot2:

Gui, Add, Edit, x0 y0 w0 h0 +ReadOnly,
GuiMain(1)
Gui, Add, Picture, x30 y70 w260 h500 vBG1 +BackgroundTrans, src/gui/trans60.png
Gui, Add, Picture, x350 y70 w280 h500 vBG2 +BackgroundTrans, src/gui/trans60.png
Gui, Add, Text, x355 y75 +BackgroundTrans, Verfügbare Labels:`n`n[HP] => Gibt die HP aus`n`n[Land] => Gibt das Land aus`n`n[Stadt] => Gibt die Stadt aus`n`n[Veh] => Gibt den Fahrzeugname aus`n`n[VehHP] => Gibt die Fahrzeughp aus `n`n[Kill] => Gibt die aktuellen Kills aus`n`n[Death] => Gibt die aktuellen Tode aus`n`n[KD] => Gibt die KD aus`n`n[HEAL] => Healt sich bei <100 HP`n`n[MOTOR] => Motorsystem

Loop, 35
{
	IniRead, CMD%A_Index%, Hotkeys.ini, Command, CMD%A_Index%, %A_Space%
	IniRead, HK%A_Index%, Hotkeys.ini, Hotkey, %A_Index%, Keine
	StringReplace, HK%A_Index%, HK%A_Index%, ~,,
	
	
}

; = Spalte 1
y := 75

cmdcount := 26
Loop, 10
{ 
	IniRead, CMD%cmdcount%, Hotkeys.ini, Command, CMD%cmdcount%, %A_Space%
	Gui, Add, Hotkey, x35 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	Gui, Font, cBlack
	Gui, Add, edit, x142 y%y% w90 h20 vCMD%cmdcount%, % CMD%cmdcount%
	y += 40
	cmdcount++
}


GuiShow()
return

;}


Equip:
GuiMain(3)
loadIni()
Gui, Add, Picture, x10 y70 w710 h220 vBG1 +BackgroundTrans, src/gui/trans60.png
Gui, Add, Text, x30 y75 w910 h70 +BackgroundTrans, Hier kannst Du deine Ausrüstprofile verwalten.`nWichtig ist das der erste Slot niemals leer sein darf.`nDie Hotkeys zum Ausrüsten findest Du unter Hotkey 1
Gui, Add, GroupBox, x15 y65 w700 h170 ,
Gui, Add, DropDownList, x22 y150 w90 h110 vProfil1_1, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x122 y150 w90 h110 vProfil1_2, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x222 y150 w90 h110 vProfil1_3, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x322 y150 w90 h110 vProfil1_4, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x422 y150 w90 h110 vProfil1_5, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x522 y150 w90 h110 vProfil1_6, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x622 y150 w90 h110 vProfil1_7, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
;V2
Gui, Add, DropDownList, x22 y200 w90 h110 vProfil2_1, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x122 y200 w90 h110 vProfil2_2, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x222 y200 w90 h110 vProfil2_3, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x322 y200 w90 h110 vProfil2_4, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x422 y200 w90 h110 vProfil2_5, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x522 y200 w90 h110 vProfil2_6, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen
Gui, Add, DropDownList, x622 y200 w90 h110 vProfil2_7, ||Messer|Deagle|Shotgun|M4|MP5|Sniper|Drogen

GuiControl, Choose, Profil1_1, %Profil1_1%
GuiControl, Choose, Profil1_2, %Profil1_2%
GuiControl, Choose, Profil1_3, %Profil1_3%
GuiControl, Choose, Profil1_4, %Profil1_4%
GuiControl, Choose, Profil1_5, %Profil1_5%
GuiControl, Choose, Profil1_6, %Profil1_6%
GuiControl, Choose, Profil1_7, %Profil1_7%


GuiControl, Choose, Profil2_1, %Profil2_1%
GuiControl, Choose, Profil2_2, %Profil2_2%
GuiControl, Choose, Profil2_3, %Profil2_3%
GuiControl, Choose, Profil2_4, %Profil2_4%
GuiControl, Choose, Profil2_5, %Profil2_5%
GuiControl, Choose, Profil2_6, %Profil2_6%
GuiControl, Choose, Profil2_7, %Profil2_7%

GuiShow()
return

Binds:
GuiMain()
URLDownloadToFile, https://agency.jameschans.de/keybinder/keybinds.txt, keybinds.txt
Sleep 100
FileRead, keybinds, keybinds.txt
Sleep 150
FileDelete, keybinds.txt
StringReplace, keybinds, keybinds, \n, `n, all
Gui, Add, Picture, x10 y70 w710 h520 vBG1 +BackgroundTrans, src/gui/trans60.png
Gui, Add, Text, x15 y75 w710 h520 +BackgroundTrans, %keybinds%

GuiShow()
return

Update:
GuiMain()
URLDownloadToFile, https://agency.jameschans.de/download/info.txt, info.txt
Sleep 100
FileRead, info, info.txt
Sleep 150
FileDelete, info.txt
Gui, Font, s11
StringReplace, info, info, \n, `n, all
Gui, Add, Picture, x10 y70 w710 h520 vBG1 +BackgroundTrans, src/gui/trans60.png
Gui, Add, Text, x15 y75 w710 h520 +BackgroundTrans, %info%


GuiShow()
return




Startseite:
GuiMain()

; Hintergründe für die Texte erstellen
Gui, Add, Picture, x30 y70 w660 h210 vBG1 +BackgroundTrans, src/gui/trans60.png

; Texte erstellen
Gui, Font, s11
Gui, Add, Text, x37 y75 vText1 +BackgroundTrans, Hey,`nWillkommen beim neuen Agency Keybinder.`n`nSolltest du Fragen, Vorschläge oder Bugmeldungen haben,`nschreibe diese bitte ins Control Panel!

GuiShow()

if(Announce == 0){
	MsgBox, 48, Keybinderänderungen, Aufgrund diverserer Änderungen muss unter den Einstellungen folgendes geändert werden:`nHP selbst einstellen -> wenn aktiviert unbedingt die HP für Paket`, Drogen und Fische einstellen`, da es ansonsten zu Problemen während den Fights geben könnte!
	IfMsgBox, Ok
	{
		IniWrite, 1, settings.ini, Announce, announce
	}
}
return

; Funktion, ob den Hauptteil des GUI's zu erstellen
GuiMain(safe := -1)
{
	keybinderVersion = 1.0.2b
	; GUI erstellen
	Gui, Destroy
	Gui, New

	; GUI transparent machen, sodass nur das Bild zu sehen ist
	Gui, +LastFound
	Gui, -Caption
	Gui, -SysMenu

	; Bilder hinzufügen
	Gui, Add, Picture, x0 y0 w900 h700 +BackgroundTrans, src/gui/pic1.jpg

	; Font einstellen
	Gui, Font, s16, Source Code Pro
	Gui, Font, cFFFFFF

	; Heading erstellen
	Gui, Add, Picture, x0 y0 w900 h40 +BackgroundTrans, src/gui/trans80.png
	Gui, Add, Text, x260 y6 +BackgroundTrans, Agency - Keybinder v.%keybinderVersion%

	; Footer erstellen
	Gui, Font, s9
	Gui, Add, Text, x766 y625 +BackgroundTrans vmadeBy, made by`nJakob,`nJohn_Reese,`nFrank_Dilauro
	GuiControl, +Center, madeBy

	; Hintergrund bei den Buttons erstellen
	Gui, Add, Picture, x730 y40 w170 h660 +BackgroundTrans, src/gui/trans60.png

	; Buttons erstellen
	Gui, Add, Button, vBT1 x850 y5 w30 h30 hwndHBT1 gGuiClose +BackgroundTrans
	Gui, Add, Button, vBT2 x810 y5 w30 h30 hwndHBT2 gMinimizeGui +BackgroundTrans
	Gui, Add, Button, vBT3 x750 y50 w130 h35 gHot hwndHBT3 +BackgroundTrans
	Gui, Add, Button, vBT8 x750 y100 w130 h35 gHot2 hwndHBT8 +BackgroundTrans
	Gui, Add, Button, vBT4 x750 y150 w130 h35 gBinds hwndHBT4 +BackgroundTrans
	Gui, Add, Button, vBT5 x750 y200 w130 h35 gEinstellungen hwndHBT5 +BackgroundTrans
	Gui, Add, Button, vBT6 x750 y250 w130 h35 gUpdate hwndHBT6 +BackgroundTrans
	Gui, Add, Button, vBT10 x750 y300 w130 h35 gEquip hwndHBT10 +BackgroundTrans
	if(safe == 1) 
		Gui, Add, Button, vBT9 x750 y380 w130 h35 gBTdynHotSave hwndHBT9 +BackgroundTrans
	else if(safe == 2)
		Gui, Add, Button, vBT9 x750 y380 w130 h35 gSave_Einstellungen hwndHBT9 +BackgroundTrans
	else if(safe == 3)
		Gui, Add, Button, vBT9 x750 y380 w130 h35 gSpeichern_Ausruesten hwndHBT9 +BackgroundTrans
	
	
	
	Gui, Add, Button, vBT7 x750 y560 w130 h35 hwndHBT7 gCP +BackgroundTrans
	Gui, Add, Button, vBT12 x750 y510 w130 h35 hwndHBT12 gConnect +BackgroundTrans
	
	ImageButton.Create(HBT1, [0, "src/gui/button_exit.png"], {2: "src/gui/button_exit_hot.png"})
	ImageButton.Create(HBT2, [0, "src/gui/button_minimize.png"], {2: "src/gui/button_minimize_hot.png"})
	ImageButton.Create(HBT3, [0, "src/gui/button_hotkeys.png"], {2: "src/gui/button_hotkeys_hot.png"})
	ImageButton.Create(HBT8, [0, "src/gui/button_hotkeys2.png"], {2: "src/gui/button_hotkeys2_hot.png"})
	ImageButton.Create(HBT4, [0, "src/gui/button_kurzbefehle.png"], {2: "src/gui/button_kurzbefehle_hot.png"})
	ImageButton.Create(HBT5, [0, "src/gui/button_einstellungen.png"], {2: "src/gui/button_einstellungen_hot.png"})
	ImageButton.Create(HBT6, [0, "src/gui/button_updatelog.png"], {2: "src/gui/button_updatelog_hot.png"})
	ImageButton.Create(HBT7, [0, "src/gui/button_cp.png"], {2: "src/gui/button_cp_hot.png"})
	ImageButton.Create(HBT9, [0, "src/gui/button_speichern.png"], {2: "src/gui/button_speichern_hot.png"})
	ImageButton.Create(HBT10, [0, "src/gui/button_ausruesten.png"], {2: "src/gui/button_ausruesten_hot.png"})
	ImageButton.Create(HBT11, [0, "src/gui/button_kurzbefehle.png"], {2: "src/gui/button_kurzbefehle_hot.png"})
	ImageButton.Create(HBT12, [0, "src/gui/button_rpg-city.png"], {2: "src/gui/button_rpg-city_hot.png"})
}

; Funktion, um die letzten Einstellungen des GUI's zu tätigen
GuiShow()
{
	; Zone hinzufügen, um das GUI zu verschieben
	Gui, Add, Text, x0 y0 w900 h700 gMoveGui +BackgroundTrans,

	; Ecken vom GUI entfernen
	WinSet, Region, 0-0 w900 h700 R44-44

	; GUI anzeigen
	Gui, Show, w900 h700
}

Connect:
RegRead GTA_SA_EXE, HKEY_CURRENT_USER, Software\SAMP, GTA_SA_EXE 
SplitPath, GTA_SA_EXE,, PFAD 
Run, %PFAD%\samp.exe server.rpg-city.de:7777
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
;]

;{
Save_Einstellungen:
GuiControlGet, Orgcall
GuiControlGet, AktvierenHP
GuiControlGet, PaketUse
GuiControlGet, DrugsUse
GuiControlGet, FishUse
GuiControlGet, angelType
GuiControlGet, AutoMotorAus
GuiControlGet, Alock
GuiControlGet, ALight



IniWrite, %AutoMotorAus%, settings.ini, Einstellung, AutoMotorAus
IniWrite, %angelType%, settings.ini, Einstellung, angelType
IniWrite, %Orgcall%, settings.ini, Einstellung, Orgcall
IniWrite, %AktvierenHP%, settings.ini, Einstellung, AktvierenHP
IniWrite, %PaketUse%, settings.ini, Einstellung, PaketUse
IniWrite, %DrugsUse%, settings.ini, Einstellung, DrugsUse
IniWrite, %FishUse%, settings.ini, Einstellung, FishUse
IniWrite, %Alock%, settings.ini, Einstellung, Alock
IniWrite, %ALight%, settings.ini, Einstellung, ALight

MsgBox, 64, Einstellung, Einstellungen gespeichert. Lade Keybinder neu...
Reload
return
;}

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

Reload
return

loadIni(){
	global
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
	IniRead, Orgcall, settings.ini, Einstellung, Orgcall, 0
	IniRead, activateHP, settings.ini, Einstellung, AktvierenHP, 0
	IniRead, PaketUse, settings.ini, Einstellung, PaketUse, 50
	IniRead, DrugsUse, settings.ini, Einstellung, DrugsUse, 50
	IniRead, FishUse, settings.ini, Einstellung, FishUse, 50
	IniRead, angelType, settings.ini, Einstellung, angelType, 3
	IniRead, AutoMotorAus, settings.ini, Einstellung, AutoMotorAus, 1
	IniRead, Alock, settings.ini, Einstellung, Alock, 1
	InIRead, ALight, settings.ini, Einstellung, ALight, 1
	InIRead, FeeEinstellung, settings.ini, Einstellung, FeeEinstellung, 0
	InIRead, fg, settings.ini, Einstellung, Festgeld, 1250000

	;Werbung
	IniRead, Werbung, settings.ini, AD, Werbung
	;Kidnap
	IniRead, Fahrer, settings.ini, Kidnap, Fahrer
	IniRead, Opfer, settings.ini, Kidnap, Opfer
	IniRead, Sitz, settings.ini, Kidnap, Sitz
	;}
	IniRead, announce, settings.ini, Announce, announce, 0
	
	fischers := 1

	info3name := 0
	info2name := 0
	info1name := 0
}









XTaste:
if(IsPlayerInAnyVehicle() && IsPlayerDriver())
{
	if(IsPlayerInRangeOfPoint(614.7936,1689.5481,6.5567, 10) || IsPlayerInRangeOfPoint(-1328.5437,2677.2109,49.6285, 10) || IsPlayerInRangeOfPoint(1595.7455,2198.9319,10.3875, 10) || IsPlayerInRangeOfPoint(2202.3479,2473.9041,10.3849, 10) || IsPlayerInRangeOfPoint(2113.8887,920.1363,10.3840, 10) || IsPlayerInRangeOfPoint(-2408.7478,975.8612,44.8655, 10) || IsPlayerInRangeOfPoint(-2029.3025,156.4132,28.4108, 10) || IsPlayerInRangeOfPoint(-1676.3165,414.2832,6.7490, 10) || IsPlayerInRangeOfPoint(1004.1802,-939.2733,41.7504, 10) || IsPlayerInRangeOfPoint(1944.1013,-1772.9907,12.9622, 10) || IsPlayerInRangeOfPoint(-90.6283,-1169.5378,1.9707, 10) || IsPlayerInRangeOfPoint(-1605.3982,-2714.4424,48.5335, 10) || IsPlayerInRangeOfPoint(-2243.8896,-2560.5569,31.9219, 10) || IsPlayerInRangeOfPoint(1380.9418,457.1429,19.4861, 10) || IsPlayerInRangeOfPoint(70.4341,1218.6842,18.3743, 10) || IsPlayerInRangeOfPoint(1555.4310,-1605.5901,13.1827, 10))
	{
		AddChatMessage(" |{005FFF}Agency{FFFFFF}| Du kannst jetzt dein Fahrzeug betanken. Drück '{FFBF00}X{FFFFFF}' zum bestätigen.")
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
		AddChatMessage( "|{005FFF}Agency{FFFFFF}| Möchtest du den Zoll jetzt öffnen? Zum öffnen '{FFBF00}X{FFFFFF}' drücken.")
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
		AddChatMessage( "|{005FFF}Agency{FFFFFF}| Möchtest du dir Drogen kaufen? Zum kaufen '{FFBF00}X{FFFFFF}' drücken.")
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
GetChatLine(1, line2)
If(InStr(line2, "Die nächste Lotto Ziehung beginnt um"))
{
	If(InStr(line2, "Es befinden sich")){
		AddChatMessage("|{005FFF}Agency{FFFFFF}| Drücke '{FFBF00}X{FFFFFF}' um ein Lotto Ticket zu kaufen")
		KeyWait, X, D, T5
		if !ErrorLevel
		{
			Random, rand, 1, 200
			SendChat("/lotto " rand)
		}
	}
}
return


fee:
GetChatLine(1, line2)
if(InStr(line2, "Du hast deinen heutigen Aktivitätsbonus"))
{
SendChat("/fee " . FeeEinstellung . "")
}
return

:?:/admin::
if(getUsername() == "John_Reese"){
	numberadmin := PlayerInput("Adminnummer ( 0 -> CT | 1 -> Wtd 1 | 2 -> Wtd 2 | 3 -> Wtd 3 | 4 -> Grab | 5 -> Accept: ")
	if(numberadmin == 0){	
		AddChatMessage("<< Hitman John_Reese hat den Auftrag ausgeführt und Quenno für 5031$ getötet. >>")
		;~ SendChat("<< Hitman John_Reese hat den Auftrag ausgeführt und Quenno für 5031$ getötet. >>")
	} else if(numberadmin == 1){
		AddChatMessage("Frank hat einen Eintrag entfernt. Verbleibend: 22 (+250$)")
	} else if(numberadmin == 2){
		AddChatMessage("Frank hat einen Eintrag entfernt. Verbleibend: 22 (+250$)")
		AddChatMessage("Alex hat einen Eintrag entfernt. Verbleibend: 1 (+250$)")
	} else if(numberadmin == 3){
		AddChatMessage("Frank hat einen Eintrag entfernt. Verbleibend: 22 (+250$)")
		AddChatMessage("Alex hat einen Eintrag entfernt. Verbleibend: 0 (+250$)")
		AddChatMessage("Afghane hat einen Eintrag entfernt. Verbleibend: 19 (+250$)")
	} else if(numberadmin == 4){
		AddChatMessage("* Du versuchst Frank_Dilauro in dein Fahrzeug zu ziehen.")
		AddChatMessage("Jemand versucht Frank_Dilauro zu befreien,")
		Sleep 4000
		AddChatMessage("Frank_Dilauro steigt in dein Fahrzeug ein und zahlt 5000$")
	} else if(numberadmin == 5){
		Settimer, accept, 500
		AddChatMessage("Du hast den Auftrag von Quenno angenommen")		
	}
} else {
	AddChatMessage("Reported Du Depp")
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
if(RegExMatch(Line1, "^<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet. >>$", regex_) && !InStr(Line1, "offline"))
{
	activeFunction := true
	contracting := -1
	contractupload(username, regex_2)
	url = https://agency.jameschans.de/keybinder/ctsperre.php?name=%username%&ctName=%regex_1%
	URLDownloadToVar(url, resultct)
	errors(resultct)
	if(resultct == 1)
		AddChatMessage("Die Contractsperre wurde eingetragen")	
	activeFunction := false
	
}
if(RegExMatch(Line3, "^<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet. >>$", regex_) && !InStr(Line3, "offline"))
{
	activeFunction := true
	contracting := -1
	contractupload(username, regex_2)
	url = https://agency.jameschans.de/keybinder/ctsperre.php?name=%username%&ctName=%regex_1%
	URLDownloadToVar(url, resultct)
	errors(resultct)
	if(resultct == 1)
		AddChatMessage("Die Contractsperre wurde eingetragen")	
	activeFunction := false
	
	
}
return


clearvariable:
if(!activeFunction){
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
}
return


hacken: ; Nach XTasten Timer
GetChatLine(0, line1)
GetChatLine(1, line2)
GetChatLine(2, line3)
name := GetUsername()

If(InStr(line1, "hat einen Eintrag entfernt. Verbleibend: ") || InStr(line2, "hat einen Eintrag entfernt. Verbleibend: ") || InStr(line3, "hat einen Eintrag entfernt. Verbleibend: ")){
	info1wanted := ""
	info2wanted := ""
	info3wanted := ""
	info3name := 0
	info2name := 0
	info1name := 0
	if(RegExMatch(line1, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", money_) && !InStr(line2, "hat einen Eintrag entfernt. Verbleibend:") && !InStr(line3, "hat einen Eintrag entfernt. Verbleibend:"))
	{
		activeFunction := true
		line1name := money_1
		info1name := money_1
		info1wanted:= money_2
		
		if(line1name == line2name || line1name == line3name || line1name == ""){
			return
		}
		urli = https://agency.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_3%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = https://agency.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=1
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		errors(result_1)
		errors(resultm_1)
		if(result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " FormatNumber(resultm_2) "$ verdient.")
			
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = https://agency.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_3%
			urli = https://agency.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=1
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			errors(result1)
			errors(resulti1)
			if(result1 == 1 && resulti1 == 1){
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Datenbankfehler: " result1 " (Result2) ~~ " resulti1 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		}
		activeFunction := false
	}
	if(RegExMatch(line1, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", moneyl1_) && RegExMatch(line2, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", moneyl2_) && !InStr(line3, "hat einen Eintrag entfernt. Verbleibend:"))
	{
		activeFunction := true
		line2name := moneyl2_1
		line1name := moneyl1_1
		
		info1name := moneyl1_1
		info1wanted:= moneyl1_2
		info2name := moneyl2_1
		info2wanted:= moneyl2_2
		
		money_gesamt := 0
		if(line2name == line1name || line2name == line3name || line2name == "" || line1name == ""){
			return
		}
		money_gesamt += moneyl2_3
		money_gesamt += moneyl1_3
		urli = https://agency.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_gesamt%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = https://agency.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=2
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		errors(result_1)
		errors(resultm_1)
		if(result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " FormatNumber(resultm_2) "$ verdient.")
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = https://agency.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_gesamt%
			urli = https://agency.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=2
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			errors(result1)
			errors(resulti1)
			if(result1 == 1 && resulti1 == 1){
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Datenbankfehler: " result1 " (Result2) ~~ " resulti1 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		}
		activeFunction := false
	}
	if(RegExMatch(line1, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", moneyl1_) && RegExMatch(line2, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", moneyl2_) && RegExMatch(line3, "^(.*) hat einen Eintrag entfernt. Verbleibend: (.*) \(\+(.+)\$\)$", moneyl3_))
	{
		activeFunction := true
		line3name := moneyl3_1
		line2name := moneyl2_1
		line1name := moneyl1_1
		
		info1name := moneyl1_1
		info1wanted:= moneyl1_2
		info2name := moneyl2_1
		info2wanted:= moneyl2_2
		info3name := moneyl3_1
		info3wanted:= moneyl3_2
		
		
		money_gesamt := 0
		
		if(line3name == line2name || line3name == line1name || line2name == "" || line1name == "" || line3name == ""){
			return
		}
		money_gesamt += moneyl3_3
		money_gesamt += moneyl2_3
		money_gesamt += moneyl1_3
		
		urli = https://agency.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_gesamt%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
		url = https://agency.jameschans.de/keybinder/gehackt.php?name=%username%&anzahl=3
		UrlDownloadToVar(url, result)
		StringSplit, result_, result, ~
		errors(result_1)
		errors(resultm_1)
		if(result_1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast bereits " result_2 " Wanteds gehackt und bereits " FormatNumber(resultm_2) "$ verdient.")
			
			VarSetCapacity(url, 0)
			VarSetCapacity(result, 0)
			VarSetCapacity(urli, 0)
			VarSetCapacity(resulti, 0)
			url = https://agency.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_gesamt%
			urli = https://agency.jameschans.de/keybinder/dm/dgehackt.php?name=%username%&anzahl=3
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			errors(result1)
			errors(resulti1)
			if(result1 == 1 && resulti1 == 1)
			{
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wochenwanteds: " FormatNumber(resulti2) " - Monatswanteds: " FormatNumber(resulti3))
			} else {
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Datenbankfehler: " result1 " (Result2) ~~ " resulti1 " (Resulti2) ~~ Bitte an John_Reese wenden")
			}
			
			Sleep 1000
		}
		activeFunction := false
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
	AddChatMessage("|{005FFF}Agency{FFFFFF}|Anti-Spam Schutz aktiviert.")
	sleep, 3000
	AddChatMessage("|{005FFF}Agency{FFFFFF}|Anti-Spam Schutz deaktiviert.")
	unblockChatInput()
}
return

Grabben:
zone := GetPlayerZone()
 City := GetPlayerCity()
GetChatLine(1, line)
if(RegExMatch(line, "^\* Du versuchst .* in dein Fahrzeug zu ziehen.$"))
{
	activeFunction := true
	SendChat("/f Ich versuche den Kunden rauszuziehen, bitte PD blockieren. |  Pos: "zone " "City "")
    Sleep 1000
    ShowGameText("~g~5 ~g~", 1000, 3) 
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		activeFunction := false
		return
	}	
    Sleep 1000
    ShowGameText("~g~4 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		activeFunction := false
		return
	}
    Sleep 1000
    ShowGameText("~g~3 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		activeFunction := false
		return
	}
    Sleep 1000
    ShowGameText("~g~2 ~g~", 1000, 3)
	GetChatLine(0, line1)
	if(InStr(line1, "Du bist nicht in der Nähe des Spielers"))
	{
		activeFunction := false
		return
	}
    Sleep 1000
    ShowGameText("~g~1 ~g~", 1000, 3)
}
GetChatLine(0, line1)
	if(RegExMatch(line1, "^Du bist nicht in der Nähe des Spielers$"))
	{
		activeFunction := false
		return
	}
; Bei Grabben Timer nach der letzten }
GetChatLine(0, line1)
if(RegExMatch(line1, "^(.*) steigt in dein Fahrzeug ein und zahlt (.*)\$$", money_))
{
		activeFunction := true
		urli = https://agency.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%money_2%
		UrlDownloadToVar(urli, resultm)
		StringSplit, resultm_, resultm, ~
        SendChat("/f Ich habe den Kunden " money_1 " erfolgreich befreit. Danke!")
		url = https://agency.jameschans.de/keybinder/ausge.php?name=%username%
		result := ""
		result_1 := ""
		URLDownloadToVar(url, result)
		StringSplit, result, result, ~
		errors(result1)
		errors(resultm_1)
		
		if(result1 == 1 && resultm_1 == 1)
		{
			AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast schon " FormatNumber(result2) " Personen befreit und " FormatNumber(resultm_2) "$ verdient.")
			
			url = https://agency.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%money_2%
			urli = https://agency.jameschans.de/keybinder/dm/dausge.php?name=%username%
			URLDownloadToVar(url, result)
			URLDownloadToVar(urli, resulti)
			StringSplit, result, result, ~
			StringSplit, resulti, resulti, ~
			errors(result1)
			errors(resulti1)
			if(result1 == 1)
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wocheneinnahmen: " FormatNumber(result2) "$ - Monatseinnahmen: " FormatNumber(result3) "$")
			
			if(resulti1 == 1)
				AddChatMessage("|{005FFF}Agency{FFFFFF}| Wochengrabs: " resulti2 " - Monatsgrabs: " resulti3)
		}
		activeFunction := false
}
activeFunction := false
return   


FischTimer:
AddChatMessage("Du kannst nun wieder zum Angeln gehen!")
Settimer, Fischtimer, OFf
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
	AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du hast beim Payday " . gesamtmoney . "$ erhalten.")
}
GetChatLine(0, Link)
IfInString, Link, http
{
res :=  SubStr(Link,(s := InStr(Link,"https://")),InStr(Link,"/",0,1,3) - s + 1)
If(!InStr(Link, radio))
AddChatMessage("[Link] Es wurde ein Link erkannt und in der Zwischenablage gespeichert")
Clipboard := res
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
	AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du bist in keinem Fahrzeug")
}
else
{
    If(IsPlayerDriver() == 0)
    {
		AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du bist nicht der Fahrer eines Fahrzeuges.")
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
        AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du befindest dich in keinem Fahrzeug.")
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
Iniread, FishUse, settings.ini, Einstellung, FishUse, 50
if(IsInChat())
	return
if(getPlayerHealth() > FishUse)
{
	AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . FishUse . " HP{FFFFFF} Fische essen.")
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
	AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du hast alle Fische Verbraucht.")
}

return

;usedrugs
HotKey6:
Iniread, DrugsUse, settings.ini, Einstellung, DrugsUse, 50
if(IsInChat())
	return
if(getPlayerHealth() > DrugsUse) 
{
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . DrugsUse . " HP{FFFFFF} deine Drogen benutzen.")
	return
}      
else
{
	SendChat("/usedrugs")
}
return

;Erstehilfe
HotKey7:
Iniread, PaketUse, settings.ini, Einstellung, PaketUse, 50
if(IsInChat())
	return

if(GetPlayerHealth() > PaketUse) 
	{
		AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast {FF0000}" . getPlayerHealth() . " HP{FFFFFF}, Du kannst erst unter {FF0000}" . PaketUse . " HP{FFFFFF} dein Erstehilfe Paket benutzen.")
		return
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





;PosF
HotKey12:
if(IsInChat())
	return
 SendChat("/F Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;PosOrg
HotKey13:
if(IsInChat())
	return
SendChat("/crew Ich befinde mich in " . getPlayerCity() . ", " . getPlayerZone() . ".")
return

;Letzter Befehl
HotKey14:
if(IsInChat())
	return
SendInput t{up}{enter}
return

;Keybinder Pausieren
HotKey15:
if(IsInChat())
	return
SetTimer, Find, Off
SetTimer, Show, Off
SetTimer, GK, Off
AddChatMessage("|{005FFF}Agency{FFFFFF}| Automatisches Findsystem deaktiviert.") 
return

;Hacken
HotKey16:
if(IsInChat())
	return
SendChat("/hacken")
return

;Accept agency
HotKey17:
if(IsInChat())
	return
SendChat("/accept wheelman")
Settimer, accept, 500
return

accept:
username := GetUsername()
GetChatLine(0, line1)
if(RegExMatch(line1, "^Du hast den Auftrag von .* angenommen$"))
{
	activeFunction := true
	Settimer, accept, off
	url = https://agency.jameschans.de/keybinder/angen.php?name=%username%
	UrlDownloadToVar(url, result)
	StringSplit, result_, result, ~
	errors(result_1)
	if(result_1 == 1)
	{
		AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast bereits " FormatNumber(result_2) " Aufträge angenommen")
		url := ""
		result := ""
		url = https://agency.jameschans.de/keybinder/dm/dangen.php?name=%username%
		URLDownloadToVar(url, result)
		StringSplit, result, result, ~
		errors(result1)
		if(result1 == 1)
			AddChatMessage("|{005FFF}Agency{FFFFFF}| Wochenaufträge: " FormatNumber(result2) " - Monatsaufträge: " FormatNumber(result3))
	}
	activeFunction := false
}
return


;Whzurücklegen
HotKey18:
if(IsInChat())
	return
SendChat("/revert")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Sie haben den Agencyauftrag zurückgelgt.")
return

;Cancelagency
HotKey19:
if(IsInChat())
	return
SendChat("/cancel agency")
return


HotKey20:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil1_1 . " " . Profil1_2 . " " . Profil1_3 . " " . Profil1_4 . " " . Profil1_5 . " " . Profil1_6 . " " . Profil1_7 . " " . Profil1_8 . " " . Profil1_9 . " " . Profil1_10 . "")
Sleep, 500
SendChat("/heal")
return


HotKey21:
if(IsInChat())
	return
SendChat("/ausruesten " . Profil2_1 . " " . Profil2_2 . " " . Profil2_3 . " " . Profil2_4 . " " . Profil2_5 . " " . Profil2_6 . " " . Profil2_7 . "")
Sleep, 500
SendChat("/heal")
return




HotKey22:
if(IsInChat())
	return
SendChat("/mask")
return

HotKey23:
if(IsInChat())
	return
SendChat("/oldcontracts")
return

HotKey24:
if(IsInChat())
	return
SendChat("/hram")
return

HotKey25:
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
			SendChat("/find " AID)
			Settimer, Find, 6000
		} else {
			contracting := GetPlayerNameByID(contracting)
			IniWrite, %contracting%, settings.ini, Zielperson, contract
		}
	}
} else {
	activeFunction := true
	SendChat("/deathcontract " contracting)
	Sleep 500
	GetChatLine(0, Lines1)
	if(InStr(Lines1, "Du bist an keinem")){
		SendChat("/offlinecontract " contracting)
		GetChatLine(0, Liness1)
		if(InStr(Liness1, "Du bist an keinem")){
			contracting := -1
			IniWrite, %contracting%, settings.ini, Zielperson, contract
			AddChatMessage("|{01DF01}Hitman{FFFFFF}|Konnte Spieler nicht Death/Offlinecontracten. Verwende zurnot /oc oder /dc")
		} else {
			GetChatLine(2, Line3)
			if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und") && InStr(Line3, "getötet (offline)")){
				RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
				contracting := -1
				contractupload(username, regex_2)
			}
		}
		
	} else {
		GetChatLine(2, Line3)
		if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und") && InStr(Line3, "getötet (offlinearrest)")){
			RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
			contracting := -1
			contractupload(username, regex_2)
		}
	}
	activeFunction := false
}
return

;~~~~~~ Frei Belegbare Hotkeys
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
printHotkey(34)
return
HotKey35:
printHotkey(35)
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
AddChatMessage( "|{005FFF}Agency{FFFFFF}| {F0F0F0}Keybinder {B40404}deaktiviert{F0F0F0}.")
ShowGameText("~r~Keybinder ~r~ deaktiviert", 2000, 3)
paused = 1
UnBlockChatInput()
Suspend permit
}
if (!A_IsSuspended)
{
AddChatMessage( "|{005FFF}Agency{FFFFFF}| {F0F0F0}Keybinder {088A4B}aktiviert{F0F0F0}.")
ShowGameText("~g~Keybinder ~g~ aktiviert", 2000, 3)
paused = 0
UnBlockChatInput()
Suspend off
}
return

:?:/tr::
Suspend Permit

Zahl1 := PlayerInput("Zahl 1: ")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Es gibt folgende Aktionen: + - * /") 
Aktion := PlayerInput("Aktion: ")
Zahl2 := PlayerInput("Zahl 2: ")
if (Aktion = "+")
{
StringSplit, calc, Aktion, +
calcresult := Zahl1 + Zahl2
}
if (Aktion = "-")
{
StringSplit, calc, Aktion, -
calcresult := Zahl1 - Zahl2
}
if (Aktion = "*")
{
StringSplit, calc, Aktion, *
calcresult := Round(Zahl1 * Zahl2, 2)
}
if (Aktion = "/")
{
StringSplit, calc, Aktion, /
calcresult := Round(Zahl1 / Zahl2, 2)
}
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Das Ergebnis lautet: {01DF01}" . calcresult . "")
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
return


/*
InteriorID := 24/7 == ID:10


*/


:?:t/fishHP::
Suspend Permit
angelType := 1
AddChatMessage("|{005FFF}Agency{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch weg, der die wenigsten HP bringt.")
return

:?:t/fishGeld::
:?:t/fishMo::
Suspend Permit
angelType := 2
AddChatMessage("|{005FFF}Agency{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' den Fisch mit den billigstens Verkaufpreis weg.")
return

:?:t/fishNix::
Suspend Permit
angelType := 3
AddChatMessage("|{005FFF}Agency{FFFFFF}| Der Keybinder wirft nun bei '/fish || /afish' keinen Fisch weg")
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

:?:/agstats::
username := GetUsername()
url = https://agency.jameschans.de/keybinder/stats.php?name=%username%
URLDownloadToVar(url, result)
StringSplit, result_, result, ~
errors(result_1)
if(result_1 == 1){
AddChatMessage("|{005FFF}Agency{FFFFFF}| Deine Agency Statistiken")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Angenommen Aufträge: " FormatNumber(result_2))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Aufträge: " FormatNumber(result_3))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts: " FormatNumber(result_4))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gehackte Wanteds: " FormatNumber(result_5))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Einnahmen: " FormatNumber(result_6) "$")
AddChatMessage("")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Monatsstats -> /agstatsmonth -- Wochenstats -> /agstatsweek")
}
return

:?:/agstatsmonth::
username := GetUsername()
url = https://agency.jameschans.de/keybinder/stats.php?name=%username%
URLDownloadToVar(url, result)
StringSplit, result_, result, ~
errors(result_1)
if(result_1 == 1){
AddChatMessage("|{005FFF}Agency{FFFFFF}| Deine Agency Statistiken für diesen Monat")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Angenommen Aufträge: " FormatNumber(result_7))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Aufträge: " FormatNumber(result_8))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts: " FormatNumber(result_9))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gehackte Wanteds: " FormatNumber(result_10))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Einnahmen: " FormatNumber(result_11) "$")
AddChatMessage("")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gesamte Stats -> /agstats -- Wochenstats -> /agstatsweek")
}
return

:?:/agstatsweek::
username := GetUsername()
url = https://agency.jameschans.de/keybinder/stats.php?name=%username%
URLDownloadToVar(url, result)
StringSplit, result_, result, ~
errors(result_1)
if(result_1 == 1){
AddChatMessage("|{005FFF}Agency{FFFFFF}| Deine Agency Statistiken für diesen Monat")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Angenommen Aufträge: " FormatNumber(result_12))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Aufträge: " FormatNumber(result_13))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts: " FormatNumber(result_14))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gehackte Wanteds: " FormatNumber(result_15))
AddChatMessage("|{005FFF}Agency{FFFFFF}| Einnahmen: " FormatNumber(result_16) "$")
AddChatMessage("")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gesamte Stats -> /agstats -- Monatsstats -> /agstatsmonth")
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


:?:/co::
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
			AddChatMessage( "|{005FFF}Agency{FFFFFF}| Versendung nicht möglich!")
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
Iniread, Werbung, settings.ini, AD, Werbung
deactive := false
SendChat("/tog")
Sleep 500
togDialog := GetDialogCaption()
if(togDialog == "Chateinstellungen"){
	togText := getDialogText()
	if(InStr(togText, "{FFFFFF}Handy: {CC0000}Deaktiviert"))
	{
		Send, {Enter}
		deactive := true
	} else {
		Send, {ESC}
	}
} 
SendChat("/ad " . Werbung . "")
if(deactive){
	SendChat("/tog")
	Sleep 500
	Send, {Enter}
}
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
AddChatMessage("|{005FFF}Agency{FFFFFF}| Gib eine Zahl für deinen Countdown ein")
zahl := PlayerInput("/Countdown: ")
AddChatMessage("|{005FFF}Agency{FFFFFF}| Du kannst den Countdown mit '{FFBF00}<{FFFFFF}' beenden.")
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
	AddChatMessage("|{005FFF}Agency{FFFFFF}|" . fisch%A_Index%_1 . " (" . fisch%A_Index%_2 . " LBS) - {FFA000} " . HP%A_Index% . " HP")
}

AddChatMessage( "|{005FFF}Agency{FFFFFF}|Die Fische bringen dir Gesamt: {FFA000}" . HP . " HP")
return



:?:/min::
Suspend Permit
Sekunden := PlayerInput("Anzahl der Sekunden: ")
if(Sekunden != "" && Sekunden != " " && Sekunden != 0)
{
        Minuten := Sekunden / 60
        Minuten := round(Minuten, 2)
        AddChatMessage( "|{005FFF}Agency{FFFFFF}|{3ADF00}" Sekunden "{FFFFFF} Sekunden sind {3ADF00}" Minuten "{FFFFFF} Minuten.")
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
if(psg[2] != -1 && psg[2] != "")
{
SendChat("/untie "psg[2])	
SendChat("/tie "psg[2])
}
sleep 500
if(psg[3] != -1 && psg[2] != "")
{
SendChat("/untie "psg[3])
SendChat("/tie "psg[3])
}
sleep 500
if(psg[4] != -1 && psg[2] != "")
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

:?:t/trpd::
Suspend Permit
anzahldrogen := Playerinput("Drogen anzahl: ")
SendChat("/trunk put drugs "anzahlmats)
return

:?:/trtm::
Suspend Permit
anzahlmats := Playerinput("Mats anzahl: ")
SendChat("/trunk take mats "anzahlmats)
return

:?:t/trtd::
Suspend Permit
anzahldrogen := Playerinput("Drogen anzahl: ")
SendChat("/trunk take drugs "anzahlmats)
return

:?:t/trtde::
Suspend Permit
SendChat("/trunk take deagle 25")
return

:?:t/sd::
Suspend Permit
userid := PlayerInput("ID/Name: ")
SendChat("/selldrugs " userid " 1 1")
return

:?:t/bombe::
Suspend Permit
userid := PlayerInput("ID/Name: ")
SendChat("/sellgun " userid " Haftbombe 1 1")
return

:?:t/messer::
Suspend Permit
userid := PlayerInput("ID/Name: ")
SendChat("/sellgun " userid " Messer 1 1")
return


:?:t/db::
Suspend Permit
SendChat("/drink bier")
Sleep 100
SendChat("/drink bier")
return



:?:t/alotto::
Suspend Permit
Random, rand, 1, 200
SendChat("/lotto " rand)
return

:?:t/aall::
Suspend, Permit
Geld_Vorher := GetPlayerMoney()
Sleep, 250
SendChat("/ausruesten all")
Sleep, 250
Geld_Nachher := GetPlayerMoney()
GesamtGeld := Geld_Nachher - Geld_Vorher
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Du hast alle Waffen für {FF0000}" . GesamtGeld . "{FFFFFF}$ ausgerüstet.")
return


:?:t/ac::
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



:?:t/cc::
:?:t/clear::
:?:t/chatclear::
Suspend Permit
Loop 300
{
  AddChatMessage( " ")
}
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Chatclear abgeschlossen")
return



:?:t/af::
:?:t/afind::
Suspend Permit
Suspend On
SendInput, /find{space}
Input, AID, V I M,{enter}
Send {enter}
SetTimer, Find, 6000
SetTimer, GK, 1000
Suspend Off
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
return

:?:t/as::
:?:t/ashow::
Suspend Permit
SendInput, /showpos{space}
Input, AID, V I M,{enter}
Send {enter}
SetTimer, Show, 6000
SetTimer, GK, 1000
Suspend Off
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Das automatische Suchen können Sie mit der eingestellten Taste deaktivieren.")
return


:?:/oc::
targetID := PlayerInput("/Offlinecontract: ")
activeFunction := true
SendChat("/offlinecontract " targetID)
GetChatLine(2, Line3)
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (offlinearrest)")){
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
activeFunction := false
return

:?:/dc::
targetID := PlayerInput("/deathcontract: ")
activeFunction := true
SendChat("/deathcontract " targetID)
GetChatLine(2, Line3)
if(InStr(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet (deatharrest)")){
	RegExMatch(Line3, "<< Hitman " username " hat den Auftrag ausgeführt und (.*) für (.+)\$ getötet ", regex_)
	contracting := -1
	contractupload(username, regex_2)
}
activeFunction := false
return




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;KIDNAP

:?:t/kidhelp::
Suspend Permit
AddChatMessage( "|{005FFF}Agency{FFFFFF}| /fahrer - Damit legst du fest, wer der Fahrer ist.") 
AddChatMessage( "|{005FFF}Agency{FFFFFF}| /opfer - Mit diesem Befehl legst du fest, wer dein Opfer ist.") 
AddChatMessage( "|{005FFF}Agency{FFFFFF}| /sitz - Dies ist der Sitzplatz im Auto, wo das Opfer hingezogen wird.")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| # um das ganze Auszuführen")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| /kidinfo - zeigt die aktuelle Aufstellung anzeigen")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| /retie - Das Opfer erneut tien")
AddChatMessage( "|{005FFF}Agency{FFFFFF}| < - Beendet /retie Timer")
return



:?:t/opfer::
opfer := PlayerInput("/Opfer-ID: ")
IniWrite, %opfer%, settings.ini, Kidnap, Opfer
name := GetPlayerNameByID(opfer)
AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast " name " (ID: " opfer ") als Opfer eingetragen")
return

:?:t/fahrer::
fahrer := PlayerInput("/Fahrer-ID: ")
IniWrite, %fahrer%, settings.ini, Kidnap, Fahrer
name := GetPlayerNameByID(fahrer)
AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast " name " (ID: " fahrer ") als Fahrer eingetragen")
return

:?:t/sitz::
sitz := PlayerInput("/Sitz-ID: ")
IniWrite, %sitz%, settings.ini, Kidnap, Sitz
AddChatMessage("|{005FFF}Agency{FFFFFF}| Du hast den Sitzplatz " sitz " eingetragen")
return

~<::
if(IsInChat())
	return
Settimer, kidnaptimer2, Off
AddChatMessage("|{005FFF}Agency{FFFFFF}|Entführungstimer beendet.")
return



~#::
if(IsInChat())
	return
IniRead, Fahrer, settings.ini, Kidnap, Fahrer, -1
IniRead, Opfer, settings.ini, Kidnap, Opfer, -1
IniRead, Sitz, settings.ini, Kidnap, Sitz, -1
if(Fahrer == -1 || Opfer == -1 || Sitz == -1)
	return
AddChatMessage( "|{005FFF}Agency{FFFFFF}| Entführung ist im Gange...")
SendChat("/kidnap " . Opfer . " " . Fahrer . " " . Sitz . "")

SetTimer, Kidnapcd, on
Settimer, kidnaptimer, on
return

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
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Abgebrochen")
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

:?:t/retie::
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

:?:t/kidinfo::
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

:?:t/wtdinfo::
Suspend Permit
wanteds := GetPlayerWanteds2()
SendChat("/f Ich habe " wanteds " Wanteds")
if(info1name != 0){
	SendChat("/f " info1name " hat " info1wanted " Wanteds")
}
if(info2name != 0){
	SendChat("/f " info2name " hat " info2wanted " Wanteds")
}
if(info3name != 0){
	SendChat("/f " info3name " hat " info3wanted " Wanteds")
}
return

:?:/user::
Suspend Permit
statsname := PlayerInput("Name: ")
stats := ""
url = http://cp.rpg-city.de/api.php?type=level|job|fraction|rank|online|playtime|org|number|money|bank|deposit|kills|deaths|premium|skin&player=%statsname%
UrlDownloadToVar(url,stats)
if(InStr(stats,"level:")) {
	StringSplit, statistiken, stats, | 
	
	StringSplit, Level, statistiken1, :
	StringSplit, Job, statistiken2, :
	StringSplit, Fraction, statistiken3, :
	StringSplit, Rank, statistiken4, :
	StringSplit, Online, statistiken5, :
	StringSplit, Playtime, statistiken6, :
	StringSplit, Crew, statistiken7, :
	StringSplit, Number, statistiken8, :
	StringSplit, Money, statistiken9, :
	StringSplit, Bank, statistiken10, :
	StringSplit, Festgeld, statistiken11, :
	StringSplit, Kills, statistiken12, :
	StringSplit, Deaths, statistiken13, :
	StringSplit, Premium, statistiken14, :
	StringSplit, Skin, statistiken15, :
	
	if(Online2 == 0){
		IsOnline=Zurzeit Online
	}else{
		IsOnline=Offline
	}
	money := Money2 + Bank2 + Festgeld2
	
	if(Premium2 == 1){
			_premium={FF4000}Der Spieler besitzt Premium
	}else{
			_premium:="Nicht vorhanden"
	}
	
	kd := Kills2 / Deaths2
	
	final = Name:`t`t`t%statsname%`nLevel:`t`t`t%Level2%`nJob:`t`t`t%Job2%`nFraktion:`t`t%Fraction2%`t(Rank: %Rank2%)`n%IsOnline%`nSpielstunden:`t`t%Playtime2%h`nOrganisation:`t`t%Org2%`nHandy Nummer:`t`t%Number2%`nGeld:`t`t`t$%money%`nFestgeld:`t`t$%Festgeld2%`nKills:`t`t`t%Kills2%`nDeaths:`t`t`t%Deaths2%`nK/D:`t`t`t%kd%`nSkin-ID:`t`t`t%Skin2%`n`n`n%_premium%
	AddChatMessage("Name: " statsname)
	AddChatMessage("Level: " Level2)
	AddChatMessage("Beruf: " Job2)
	AddChatMessage("Fraktion: " Fraction2 " (Rank: " Rank2 ")")
	AddChatMessage(IsOnline)
	AddChatMessage("Spielstunden: " Playtime2)
	AddChatMessage("Handy Nummer: " Number2)
	AddChatMessage("Geld: " FormatNumber(money) "$")
	AddChatMessage("Festgeld: " FormatNumber(Festgeld2) "$")
	AddChatMessage("Kills: " Kills2)
	AddChatMessage("Deaths: " Deaths2)
	AddChatMessage("K/D: " kd)
	AddChatMessage("Skin-ID: " Skin2)
	AddChatMessage("Premium: " _premium)
}else{
	AddChatMessage("Das Profil ist nicht auf Öffentlich")
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Vorrübergehende Copliste

:?:t/showcts::
Suspend Permit
url = https://agency.jameschans.de/keybinder/getctsperre.php?name=%username%
count := 0
UrlDownloadToVar(url, result)
Loop, Parse, result, |
{
	StringSplit, cts_, A_LoopField, ~
	if(cts_1 != ""){
		AddChatMessage("{01DF01}" . cts_1 . ": {FFFFFF}" . cts_2 . "Uhr")
		count++
	}
}
if(count == 0){
	AddChatMessage("|{005FFF}Agency{FFFFFF}|Es hat niemand eine Contractsperre")
}

return

:?:t/cops::
copscount := 0
UrlDownloadToVar("https://agency.jameschans.de/keybinder/allcops.php", result)
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
if(copscount != 0)
{
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Es sind " copscount " Cops online")
} else if(copscount == 0){
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Es sind 0 Cops online")
}
return

:?:t/findcops::
AddChatMessage("|{005FFF}Agency{FFFFFF}| Es werden nun alle Cops nacheinander 1x gesucht!")
copscount := 0
UrlDownloadToVar("https://agency.jameschans.de/keybinder/allcops.php", result)
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
			SendChat("/find " . member1)
			copscount++
			Sleep 6000
		}
	}
}
return


:?:t/addcop::
Suspend Permit
playername := GetUsername()
cname := PlayerInput("/Cop-Name: ")
cFrak := PlayerInput("/Cop-Fraktion ( 0 -> LSPD | 1 -> FBI ): ")
if cname is number
	cname := GetPlayerNameByID(cname)
url = https://agency.jameschans.de/keybinder/addcop.php?name=%cname%&uname=%playername%&frak=%cFrak%
URLDownloadToVar(url, result)
StringSplit, result, result, ~
errors(result1)
if(result1 == 1)
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Der Cop " cname " wurde erfolgreich eingetragen")
else
	AddChatMessage(result)
return

:?:t/delcop::
Suspend Permit
username := GetUsername()
cname := PlayerInput("/Cop-Name: ")
url = https://agency.jameschans.de/keybinder/delcop.php?name=%cname%&uname=%username%
URLDownloadToVar(url, result)
StringSplit, result, result, ~
errors(result1)
if(result1 == 1)
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Der Cop " cname " wurde erfolgreich ausgetragen")
return

:?:t/relog::
restart()
return

:?:t/setfee::
AddChatMessage("|{005FFF}Agency{FFFFFF}| Der aktuelle /fee Preis ist bei " . FeeEinstellung)
FeeEinstellung := PlayerInput("/Neuer /fee-Preis: ")
if(FeeEinstellung < 0 && FeeEinstellung > 250){
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Diese Einstellung ist nicht möglich. Minimum ist 0 Maximum ist 250")
	return
} else {
	SendChat("/fee " FeeEinstellung)
	IniWrite, %FeeEinstellung%, settings.ini, Einstellung, FeeEinstellung
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Die /fee-Einstellung wurde auf " FeeEinstellung " geändert.")
}
return

:?:t/setfg::
AddChatMessage("|{005FFF}Agency{FFFFFF}| Der aktuelle /fg Preis ist bei " . fg)
fg := PlayerInput("/Neuer /fg-Preis: ")
if(fg < 1 && fg > 1250000){
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Diese Einstellung ist nicht möglich. Minimum ist 1 Maximum ist 1 250 000")
	return
} else {
	IniWrite, %fg%, settings.ini, Einstellung, Festgeld
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Die /fg-Einstellung wurde auf " fg " geändert.")
}
return

:?:/editad::
AddChatMessage("|{005FFF}Agency{FFFFFF}| Die aktuelle AD ist " . Werbung)
Werbung := PlayerInput("/Neue /sad Meldung: ")
if(Werbung == ""){
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Diese Einstellung ist nicht möglich, da sie leer ist.")
	return
} else {
	IniWrite, %Werbung%, settings.ini, AD, Werbung
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Die /sad-Einstellung wurde auf " Werbung " geändert.")
	IniRead, Werbung, settings.ini, AD, Werbung
}
return

:?:/showad::
IniRead, Werbung, settings.ini, AD, Werbung
AddChatMessage("|{005FFF}Agency{FFFFFF}| Die aktuelle AD ist {01DF01}" . Werbung)
return

:?:/showfg::
IniRead, fg, settings.ini, Einstellung, Festgeld
AddChatMessage("|{005FFF}Agency{FFFFFF}| Das aktuelle Festgeld ist {01DF01}" . FormatNumber(fg) . "$")
return

:?:/showfee::
IniRead, FeeEinstellung, settings.ini, Einstellung, FeeEinstellung
AddChatMessage("|{005FFF}Agency{FFFFFF}| Die /fee-Einstellung ist {01DF01}" . FeeEinstellung)
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


errors(output){
	if(output != 1){ 
		AddChatMessage("{FF0000} Fehler: " output " --- Bitte an John_Reese wenden")
		return
	}
}

errors2(output){
	if(output != 1){ 
		MsgBox, 16, Fehler, Fehler bei Verifizierung.`nFehlercode: %output%, 5
		ExitApp
	}
}

contractupload(username, geld){
	url = https://agency.jameschans.de/keybinder/contract.php?name=%username%
	urli = https://agency.jameschans.de/keybinder/dm/dcontract.php?name=%username%
	urlii = https://agency.jameschans.de/keybinder/einnahme.php?name=%username%&einnahme=%geld%
	urliii = https://agency.jameschans.de/keybinder/dm/deinnahme.php?name=%username%&einnahme=%geld%
	URLDownloadToVar(url, result1)
	URLDownloadToVar(urli, result2)
	URLDownloadToVar(urlii, result3)
	URLDownloadToVar(urliii, result4)
	
	StringSplit, output1_, result1, ~
	StringSplit, output2_, result2, ~
	StringSplit, output3_, result3, ~
	StringSplit, output4_, result4, ~
	IniWrite, -1, settings.ini, Zielperson, contract
	if(output1_1 == 1){
	AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts: " FormatNumber(output1_2) " --- Einnahmen: " FormatNumber(output3_2))
	} else {
		AddChatMessage("Datenbankfehler: " output1_2 " ~~ Bitte an John_Reese wenden")
	}
	if(output2_1 == 1)
	{
		AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts ( Monat ): " FormatNumber(output2_3) " --- Einnahmen ( Monat ): " FormatNumber(output4_3))
		AddChatMessage("|{005FFF}Agency{FFFFFF}| Ausgeführte Contracts ( Woche ): " FormatNumber(output2_2) " --- Einnahmen ( Woche ): " FormatNumber(output4_2))
	} else {
		AddChatMessage("Datenbankfehler " output2_2 " ~~ Bitte an John_Reese wenden")
	}	
	
}



FischPreis(FishName, FishLBS) {
	if(FishName == "Delphin")
		Preis := FishLBS*4
	else if(FishName == "Makrele")
		Preis := FishLBS*5
	else if(FishName == "Segelfisch")
		Preis := FishLBS*4
	else if(FishName == "Bernfisch")
		Preis := FishLBS*1
	else if(FishName == "Hai")
		Preis := FishLBS*4
	else if(FishName == "Schwertfisch")
		Preis := FishLBS*2
	else if(FishName == "Schildkröte")
		Preis := FishLBS*8
	else if(FishName == "Thunfisch")
		Preis := FishLBS*8
	else if(FishName == "Hecht")
		Preis := FishLBS*6
	else if(FishName == "Aal")
		Preis := FishLBS*6
	else if(FishName == "Forelle")
		Preis := FishLBS*3
	else if(FishName == "Wolfbarsch")
		Preis := FishLBS*8
	else if(FishName == "Zackenbarsch")
		Preis := FishLBS*2
	else if(FishName == "Katzenfisch")
		Preis := FishLBS*3
	else if(FishName == "Blauer Fächerfisch")
		Preis := FishLBS*1
	else if(FishName == "Roter Schnapper")
		Preis := FishLBS*2
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
io := DllCall("wininet\InternetOpenA"
, "Str", UserAgent
, "UInt", AccessType
, "Str", Proxy
, "Str", ProxyBypass
, "UInt", 0)
iou := DllCall("wininet\InternetOpenUrlA"
, "UInt", io
, "Str", url
, "Str", ""
, "UInt", 0
, "UInt", 0x80000000
, "UInt", 0)
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

unpatchDialog:
if(isDialogOpen()){
	dialogHide()
}
return
 
 
GetPlayerWanteds2(){
	SetTimer, unpatchDialog, 5
	
	SendChat("/stats")
	sleep, 200
	stats := getDialogText()
	if(InStr(stats, "Wanteds:")){
		RegExMatch(stats, "Wanteds\: ([0-9]+)", params)
	}
	SetTimer, unpatchDialog, Off
	if(params1){
		return %params1%
	}else{
		return 0
	}
}