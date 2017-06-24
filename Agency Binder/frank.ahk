; Wichtiges Zeug
#SingleInstance, force

; Implementation anderer Scripte
#include inc\ImageButton.ahk

; Globale Buttonvariablen erstellen
global BT1, BT2, BT3, BT4, BT5, BT6, BT7, BT8, BT9, BT10 := -1
global HBT1, HBT2, HBT3, HBT4, HBT5, HBT6, HBT7, HBT8, HBT9, HBT10 := -1
global madeBy := -1
loadIni()

; GUI erstellen
GoSub, Startseite


; ============================================== GUI-Control ============================================== ;{
; GUI verschiebbar machen
MoveGui:
PostMessage, 0xA1, 2,,, A
return

; Keybinder minimieren, wenn der Button gedr�ckt wurde
MinimizeGui:
Gui, Minimize
return

; Keybinder beenden, wenn der Button gedr�ckt wurde
GuiClose:
ExitApp

; Agency CP �ffnen
CP:
Run, https://agency.jameschans.de/
return


Einstellungen:
GuiMain(2)



Gui, Add, Picture, x30 y60 w660 h500 vBG1 +BackgroundTrans, src/gui/trans60.png

Gui, Add, GroupBox, x45 y65 w500 h180 +BackgroundTrans cwhite,
Gui, Add, Text, x60 y75 +BackgroundTrans cwhite, de/aktivieren

Gui, Add, CheckBox, x60 y90 w12 h12 +BackgroundTrans cwhite vOrgcall Checked%Orgcall%,
Gui, Add, Text, x100 y90 +BackgroundTrans cwhite, Meldet den Backup-call auch im /crew-chat?

Gui, Add, Checkbox, x60 y115 w12 h12 +BackgroundTrans cwhite gAktivierenHP vAktvierenHP Checked%activateHP% ,
Gui, Add, Text, x100 y115 +BackgroundTrans cwhite, Die HP selbst einstellen, wann er Paket/Fische/Drogen used?

Gui, Add, Checkbox, x60 y140 w12 h12 +BackgroundTrans cwhite vAutoMotorAus Checked%AutoMotorAus% ,
Gui, add, Text, x100 y140 +BackgroundTrans cwhite, beim Absteigen den Motor ausschalten?

Gui, Add, Checkbox, x60 y165 w12 h12 +BackgroundTrans cwhite  vAlock Checked%Alock%,
Gui, Add, Text, x100 y165 +BackgroundTrans cwhite, Fahrzeug abschlie�en beim Motorstart

Gui, add, Checkbox, x60 y190 w12 h12 +BackgroundTrans cwhite vALight Checked%ALight%,
Gui, Add, Text, x100 y190 +BackgroundTrans cwhite, Fahrzeuglicht einschalten bei Motorstart
Gui, Font, cBlack
;Fisch
Gui, Add, GroupBox, x45 y250 w500 h100 +BackgroundTrans cwhite,
Gui, Add, Text, x50 y260 +BackgroundTrans cwhite, Einstellung /Fish
Gui, Add, Text, x50 y280 +BackgroundTrans cwhite, Billigsten Fisch, HP niedrigsten Fisch oder keinen Fisch wegschmei�en?
Gui, Add, Text, x150 y300 +BackgroundTrans cwhite,HP = 1 || $ = 2 || Nix = 3
Gui, Add, Edit, x50 y300 w100 h16 vangelType, %angelType%

Gui, Add, Groupbox, x45 y350 w300 h115 vHPGroupbox +BackgroundTrans, 
Gui, Add, Text, x55 y360 +BackgroundTrans cwhite vHPText, Einstellung HP 

Gui, Add, Edit, x60 y380 w40 h20 vPaketUse, %PaketUse%
Gui, Add, Edit, x60 y410 w40 h20 vDrugsUse, %DrugsUse%
Gui, Add, Edit, x60 y440 w40 h20 vFishUse, %FishUse%
Gui, Add, Text, x110 y380 +BackgroundTrans cwhite vHPPaket, HP Erstehilfe Paket
Gui, Add, Text, x110 y410 +BackgroundTrans cwhite vHPDrogen, HP Drogen
Gui, Add, Text, x110 y440 +BackgroundTrans cwhite vHPFische, HP Fische

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
Gui, Add, text, x142 y75 +BackGroundTrans cwhite, Motor An/Aus
Gui, Add, text, x142 y115 +BackGroundTrans cwhite, Fahrzeug Abschlie�en
Gui, Add, text, x142 y155 +BackGroundTrans cwhite, Members
Gui, Add, text, x142 y195 +BackGroundTrans cwhite, Crewmembers
Gui, Add, text, x142 y235 +BackGroundTrans cwhite, Fisch Essen (1-5)
Gui, Add, text, x142 y275 +BackGroundTrans cwhite, usedrugs 
Gui, Add, text, x142 y315 +BackGroundTrans cwhite, Erstehilfe 
Gui, Add, text, x142 y355 +BackGroundTrans cwhite, Call Backup
Gui, Add, text, x142 y395 +BackGroundTrans cwhite, Cancel Backup
Gui, Add, text, x142 y435 +BackGroundTrans cwhite, Help Backup
Gui, Add, text, x142 y475 +BackGroundTrans cwhite, Ejected alle im Car
Gui, Add, text, x142 y515 +BackGroundTrans cwhite, Position Im F-Chat

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
Gui, Add, text, x422 y80 +BackGroundTrans cwhite, Position im Org-Chat
Gui, Add, text, x422 y120 +BackGroundTrans cwhite, Letzten Befehl Wiederholen
Gui, Add, text, x422 y160 +BackGroundTrans cwhite, Auto. Findystem deaktivieren
Gui, Add, text, x422 y200 +BackGroundTrans cwhite, Hackvorgang Starten
Gui, Add, text, x422 y240 +BackGroundTrans cwhite, Accept Wheelman
Gui, Add, text, x422 y280 +BackGroundTrans cwhite, Revert Auftrag
Gui, Add, text, x422 y320 +BackGroundTrans cwhite, Cancel Wheelman
Gui, Add, text, x422 y360 +BackGroundTrans cwhite, Ausruesten(V1)
Gui, Add, text, x422 y400 +BackGroundTrans cwhite, Ausruesten(V2)
Gui, Add, text, x422 y440 +BackGroundTrans cwhite, Maske aufsetzen
Gui, Add, text, x422 y480 +BackGroundTrans cwhite, /oldcontracts
Gui, Add, text, x422 y520 +BackGroundTrans cwhite, /hram
Gui, Add, text, x422 y560 +BackGroundTrans cwhite, Contractsystem


GuiShow()
return

Hot2:
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

cmdcount := 26
Loop, 10
{ 
	Gui, Add, Hotkey, x35 y%y% w90 h20 vHK%cmdcount% gLabel, % HK%cmdcount%
	Gui, Add, edit, x142 y%y% w90 h20 vCMD%cmdcount%, % CMD%cmdcount%
	y += 40
	cmdcount++
}


GuiShow()
return

;}

Startseite:
GuiMain()

; Hintergr�nde f�r die Texte erstellen
Gui, Add, Picture, x30 y70 w660 h210 vBG1 +BackgroundTrans, src/gui/trans60.png

; Texte erstellen
Gui, Font, s11
Gui, Add, Text, x37 y75 vText1 +BackgroundTrans, Hey,`nWillkommen beim neuen Agency Keybinder.`n`nSolltest du Fragen, Vorschl�ge oder Bugmeldungen haben,`nschreibe diese bitte ins Control Panel!

GuiShow()
return

; Funktion, ob den Hauptteil des GUI's zu erstellen
GuiMain(safe := -1)
{
	
	keybinderVersion = 1.0.2a
	; GUI erstellen
	Gui, Destroy
	Gui, New

	; GUI transparent machen, sodass nur das Bild zu sehen ist
	Gui, +LastFound
	Gui, -Caption
	Gui, -SysMenu

	; Bilder hinzuf�gen
	Gui, Add, Picture, x0 y0 w900 h600 +BackgroundTrans, src/gui/pic1.jpg

	; Font einstellen
	Gui, Font, s16, Source Code Pro
	Gui, Font, cFFFFFF

	; Heading erstellen
	Gui, Add, Picture, x0 y0 w900 h40 +BackgroundTrans, src/gui/trans80.png
	Gui, Add, Text, x260 y6 +BackgroundTrans, Agency - Keybinder v.%keybinderVersion%

	; Footer erstellen
	Gui, Font, s9
	Gui, Add, Text, x766 y525 +BackgroundTrans vmadeBy, made by`nPietro_Miller,`nJohn_Reese,`nFrank_Dilauro
	GuiControl, +Center, madeBy

	; Hintergrund bei den Buttons erstellen
	Gui, Add, Picture, x730 y40 w170 h560 +BackgroundTrans, src/gui/trans60.png

	; Buttons erstellen
	Gui, Add, Button, vBT1 x850 y5 w30 h30 hwndHBT1 gGuiClose +BackgroundTrans
	Gui, Add, Button, vBT2 x810 y5 w30 h30 hwndHBT2 gMinimizeGui +BackgroundTrans
	Gui, Add, Button, vBT3 x750 y50 w130 h35 gHot hwndHBT3 +BackgroundTrans
	Gui, Add, Button, vBT8 x750 y100 w130 h35 gHot2 hwndHBT8 +BackgroundTrans
	Gui, Add, Button, vBT4 x750 y150 w130 h35 hwndHBT4 +BackgroundTrans
	Gui, Add, Button, vBT5 x750 y200 w130 h35 gEinstellungen hwndHBT5 +BackgroundTrans
	Gui, Add, Button, vBT6 x750 y250 w130 h35 hwndHBT6 +BackgroundTrans
	Gui, Add, Button, vBT10 x750 y300 w130 h35 hwndHBT10 +BackgroundTrans
	if(safe == 1) 
		Gui, Add, Button, vBT9 x750 y380 w130 h35 gBTdynHotSave hwndHBT9 +BackgroundTrans
	else if(safe == 2)
		Gui, Add, Button, vBT9 x750 y380 w130 h35 gSave_Einstellungen hwndHBT9 +BackgroundTrans
	
	
	
	Gui, Add, Button, vBT7 x750 y460 w130 h35 hwndHBT7 gCP +BackgroundTrans
	
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
}

; Funktion, um die letzten Einstellungen des GUI's zu t�tigen
GuiShow()
{
	; Zone hinzuf�gen, um das GUI zu verschieben
	Gui, Add, Text, x0 y0 w900 h600 gMoveGui +BackgroundTrans,

	; Ecken vom GUI entfernen
	WinSet, Region, 0-0 w900 h600 R44-44

	; GUI anzeigen
	Gui, Show, w900 h600
}

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


loadIni(){
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
	IniRead, activateHP, settings.ini, Einstellung, AktvierenHP
	IniRead, PaketUse, settings.ini, Einstellung, PaketUse
	IniRead, DrugsUse, settings.ini, Einstellung, DrugsUse
	IniRead, FishUse, settings.ini, Einstellung, FishUse
	IniRead, angelType, settings.ini, Einstellung, angelType, 3
	IniRead, AutoMotorAus, settings.ini, Einstellung, AutoMotorAus
	IniRead, Alock, settings.ini, Einstellung, Alock
	InIRead, ALight, settings.ini, Einstellung, ALight

	;Werbung
	IniRead, Werbung, settings.ini, AD, Werbung
	;Kidnap
	IniRead, Fahrer, settings.ini, Kidnap, Fahrer
	IniRead, Opfer, settings.ini, Kidnap, Opfer
	IniRead, Sitz, settings.ini, Kidnap, Sitz
	;}
	fischers := 1

	info3name := 0
	info2name := 0
	info1name := 0
}

;}
; =========================================================================================================