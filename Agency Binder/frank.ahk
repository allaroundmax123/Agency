; Wichtiges Zeug
#SingleInstance, force

; Implementation anderer Scripte
#include inc\ImageButton.ahk

; Globale Buttonvariablen erstellen
global BT1, BT2, BT3, BT4, BT5, BT6, BT7 := -1
global HBT1, HBT2, HBT3, HBT4, HBT5, HBT6, HBT7 := -1
global madeBy := -1

; GUI erstellen
GoSub, Startseite
return

; ============================================== GUI-Control ============================================== ;{
; GUI verschiebbar machen
MoveGui:
PostMessage, 0xA1, 2,,, A
return

; Keybinder minimieren, wenn der Button gedrückt wurde
MinimizeGui:
Gui, Minimize
return

; Keybinder beenden, wenn der Button gedrückt wurde
GuiClose:
ExitApp

; Das GS-Control Panel öffnen, wenn auf den Button geklickt wurde
CP:
Run, http://dorf.spdns.de/rpgcity/gs
return

; Einstellungs-Tab anzeigen, wenn auf den Button geklickt wurde
Einstellungen:
GuiMain()

GuiShow()
return

; Startseite des GUI's anzeigen
Startseite:
GuiMain()

; Hintergründe für die Texte erstellen
Gui, Add, Picture, x30 y70 w560 h110 vBG1 +BackgroundTrans, src/gui/trans60.png

; Texte erstellen
Gui, Font, s11
Gui, Add, Text, x37 y75 vText1 +BackgroundTrans, Hey, Dude!`nWillkommen beim neuen Wheelman Keybinder.`n`nSolltest du Fragen, Vorschläge oder Bugmeldungen haben,`nschreibe diese bitte ins Control Panel!

GuiShow()
return

; Funktion, ob den Hauptteil des GUI's zu erstellen
GuiMain()
{
	; GUI erstellen
	Gui, Destroy
	Gui, New

	; GUI transparent machen, sodass nur das Bild zu sehen ist
	Gui, +LastFound
	Gui, -Caption
	Gui, -SysMenu

	; Bilder hinzufügen
	Random, randPicture, 1, 4
	Gui, Add, Picture, x0 y0 +BackgroundTrans, src/gui/pic%randPicture%.jpg

	; Font einstellen
	Gui, Font, s16, Source Code Pro
	Gui, Font, cFFFFFF

	; Heading erstellen
	Gui, Add, Picture, x0 y0 w800 h40 +BackgroundTrans, src/gui/trans80.png
	Gui, Add, Text, x190 y6 +BackgroundTrans, Agency - Keybinder v1.0

	; Footer erstellen
	Gui, Font, s9
	Gui, Add, Text, x666 y425 +BackgroundTrans vmadeBy, made by`nPietro_Miller,`nJohn_Reese,`nFrank_Dilauro
	GuiControl, +Center, madeBy

	; Hintergrund bei den Buttons erstellen
	Gui, Add, Picture, x630 y40 w170 h460 +BackgroundTrans, src/gui/trans60.png

	; Buttons erstellen
	Gui, Add, Button, vBT1 x750 y5 w30 h30 hwndHBT1 gGuiClose +BackgroundTrans
	Gui, Add, Button, vBT2 x710 y5 w30 h30 hwndHBT2 gMinimizeGui +BackgroundTrans
	Gui, Add, Button, vBT3 x650 y50 w130 h35 hwndHBT3 +BackgroundTrans
	Gui, Add, Button, vBT4 x650 y100 w130 h35 hwndHBT4 +BackgroundTrans
	Gui, Add, Button, vBT5 x650 y150 w130 h35 gEinstellungen hwndHBT5 +BackgroundTrans
	Gui, Add, Button, vBT6 x650 y200 w130 h35 hwndHBT6 +BackgroundTrans
	Gui, Add, Button, vBT7 x650 y380 w130 h35 hwndHBT7 gCP +BackgroundTrans
	ImageButton.Create(HBT1, [0, "src/gui/button_exit.png"], {2: "src/gui/button_exit_hot.png"})
	ImageButton.Create(HBT2, [0, "src/gui/button_minimize.png"], {2: "src/gui/button_minimize_hot.png"})
	ImageButton.Create(HBT3, [0, "src/gui/button_hotkeys.png"], {2: "src/gui/button_hotkeys_hot.png"})
	ImageButton.Create(HBT4, [0, "src/gui/button_kurzbefehle.png"], {2: "src/gui/button_kurzbefehle_hot.png"})
	ImageButton.Create(HBT5, [0, "src/gui/button_einstellungen.png"], {2: "src/gui/button_einstellungen_hot.png"})
	ImageButton.Create(HBT6, [0, "src/gui/button_updatelog.png"], {2: "src/gui/button_updatelog_hot.png"})
	ImageButton.Create(HBT7, [0, "src/gui/button_cp.png"], {2: "src/gui/button_cp_hot.png"})
}

; Funktion, um die letzten Einstellungen des GUI's zu tätigen
GuiShow()
{
	; Zone hinzufügen, um das GUI zu verschieben
	Gui, Add, Text, x0 y0 w800 h500 gMoveGui +BackgroundTrans,

	; Ecken vom GUI entfernen
	WinSet, Region, 0-0 w800 h500 R44-44

	; GUI anzeigen
	Gui, Show, w800 h500
}
;}
; =========================================================================================================