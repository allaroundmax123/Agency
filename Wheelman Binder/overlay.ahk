#NoEnv 
; UGBASE.EU
 
 
; Error-Codes 
API_ERROR_NONE 								:= 0
API_ERROR_SNAPSHOT_FAILED 					:= 1
API_ERROR_SAMP_NOT_FOUND 					:= 2
API_ERROR_REMOTE_MEMORY_ALLOCATION_FAILED 	:= 3
API_ERROR_WRITEPROCESSMEMORY_FAILED 		:= 4
API_ERROR_GETPROCADDRESS_FAILED 			:= 5
API_ERROR_REMOTETHREAD_FAILED 				:= 6
API_ERROR_INVALID_GTA_HANDLE				:= 7
API_ERROR_PIPE_DOESNT_RESPOND 				:= 8
API_ERROR_STRING_TOO_LONG					:= 9

PLAYER_STATE_LEAVING_VEHICLE 				:= 0
PLAYER_STATE_NORMAL 						:= 1
PLAYER_STATE_DRIVING 						:= 50
PLAYER_STATE_DYING 							:= 54
PLAYER_STATE_DEAD 							:= 55

CALLBACK_HEAL								:= 0
CALLBACK_ARMOR								:= 1
CALLBACK_POSITION							:= 2
CALLBACK_ENTEREXIT							:= 3
CALLBACK_VEHICLE_ENTEREXIT					:= 4
CALLBACK_VEHICLE_HEALTH						:= 5
CALLBACK_VEHICLE_ENGINE						:= 6
CALLBACK_VEHICLE_LOCK						:= 7
CALLBACK_VEHICLE_SPEED						:= 8
CALLBACK_WEAPON_CLIP						:= 9
CALLBACK_WEAPON_TOTALCLIP					:= 10
CALLBACK_WEAPON_SWITCH						:= 11
CALLBACK_CHATLOG							:= 12


PATH_API := RelToAbs(A_ScriptDir, "overlay.dll")

hModule := DllCall("LoadLibrary", Str, PATH_API)
if(hModule == -1 || hModule == 0)
{
	MsgBox, 48, API - Fehler, Die API.dll konnte nicht gefunden werden.`nDer Keybinder wird nun beendet.
	ExitApp
}

; Funktionsadressen in der DLL

;BlockChatInput_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BlockChatInput")

TextCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextCreate")
TextDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextDestroy")
TextSetShadow_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetShadow")
TextSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetShown")
TextSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetColor")
TextSetPos_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetPos")
TextSetString_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextSetString")
TextUpdate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_TextUpdate")

BoxCreate_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxCreate")
BoxDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxDestroy")
BoxSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetShown")
BoxSetBorder_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetBorder")
BoxSetBorderColor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetBorderColor")
BoxSetColor_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetColor")
BoxSetHeight_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetHeight")
BoxSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetPos")
BoxSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_BoxSetWidth")

DestroyAllVisual_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "API_DestroyAllVisual")
ShowAllVisual_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_ShowAllVisual")
HideAllVisual_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "API_HideAllVisual")
/*
BlockChatInput(block)
{
	global BlockChatInput_func
	res := DllCall(BlockChatInput_func,UChar,block)
	return res
}
*/
TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
{
	global TextCreate_func
	res := DllCall(TextCreate_func,Str,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,Str,text,UChar,shadow,UChar,show)
	return res
}

TextDestroy(id)
{
	global TextDestroy_func
	res := DllCall(TextDestroy_func,Int,id)
	return res
}

TextSetShadow(id, shadow)
{
	global TextSetShadow_func
	res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
	return res
}

TextSetShown(id, show)
{
	global TextSetShown_func
	res := DllCall(TextSetShown_func,Int,id,UChar,show)
	return res
}

TextSetColor(id,color)
{
	global TextSetColor_func
	res := DllCall(TextSetColor_func,Int,id,UInt,color)
	return res
}

TextSetPos(id,x,y)
{
	global TextSetPos_func
	res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
	return res
}

TextSetString(id,Text)
{
	global TextSetString_func
	res := DllCall(TextSetString_func,Int,id,Str,Text)
	return res
}

TextUpdate(id,Font,Fontsize,bold,italic)
{
	global TextUpdate_func
	res := DllCall(TextUpdate_func,Int,id,Str,Font,int,Fontsize,UChar,bold,UChar,italic)
	return res
}

BoxCreate(x,y,width,height,Color,show)
{
	global BoxCreate_func
	res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
	return res
}

BoxDestroy(id)
{
	global BoxDestroy_func
	res := DllCall(BoxDestroy_func,Int,id)
	return res
}

BoxSetShown(id,Show)
{
	global BoxSetShown_func 
	res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
	return res
}
	
BoxSetBorder(id,height,Show)
{
	global BoxSetBorder_func
	res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
	return res
}


BoxSetBorderColor(id,Color)
{
	global BoxSetBorderColor_func 
	res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
	return res
}

BoxSetColor(id,Color)
{
	global BoxSetColor_func
	res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
	return res
}

BoxSetHeight(id,height)
{
	global BoxSetHeight_func
	res := DllCall(BoxSetHeight_func,Int,id,Int,height)
	return res
}

BoxSetPos(id,x,y)
{
	global BoxSetPos_func	
	res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
	return res
}

BoxSetWidth(id,width)
{
	global BoxSetWidth_func
	res := DllCall(BoxSetWidth_func,Int,id,Int,width)
	return res
}

DestroyAllVisual()
{
	global DestroyAllVisual_func
	res := DllCall(DestroyAllVisual_func)
	return res 
}

ShowAllVisual()
{
	global ShowAllVisual_func
	res := DllCall(ShowAllVisual_func)
	return res
}

HideAllVisual()
{
	global HideAllVisual_func
	res := DllCall(HideAllVisual_func )
	return res
}


DecimalToHex(Var){
	; Convert a decimal integer to hexadecimal:
	SetFormat, IntegerFast, hex
	Dec2Hex += Var ; Sets Dec2Hex (which previously contained 11) to be 0xb.
	Dec2Hex .= "" ; Necessary due to the "fast" mode.
	SetFormat, IntegerFast, d
	StringTrimLeft, Dec2Hex, Dec2Hex, 2 ; removes 0x from the string
	StringUpper, Dec2Hex, Dec2Hex ; makes it all caps
	sDec2Hex .= Dec2Hex
	return sDec2Hex
}

RelToAbs(root, dir, s = "\") {
	pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
		, root := SubStr(root, len + 1), sk := 0
	If InStr(root, s, "", 0) = StrLen(root)
		StringTrimRight, root, root, 1
	If InStr(dir, s, "", 0) = StrLen(dir)
		StringTrimRight, dir, dir, 1
	Loop, Parse, dir, %s%
	{
		If A_LoopField = ..
			StringLeft, root, root, InStr(root, s, "", 0) - 1
		Else If A_LoopField =
			root =
		Else If A_LoopField != .
			Continue
		StringReplace, dir, dir, %A_LoopField%%s%
	}
	Return, pr . root . s . dir
}

