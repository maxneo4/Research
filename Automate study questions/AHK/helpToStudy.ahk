#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
FileEncoding, UTF-8
SetTitleMatchMode, 2

nqs := []
props_index = 1
NCorrect = 0
NWrong = 0
NSkiped = 0
BCount = 0
IfExist, onlyAsk.txt
{
	MsgBox, 4, , Would you like to continue from last session?
	IfMsgBox, Yes
		FileRead, onlyAsk, onlyAsk.txt
	else
		{
			onlyAsk = 
			FileDelete, onlyAsk.txt
		}
}

tempOnlyAsk := ""

file = questions.txt
if(A_Args.MaxIndex() > 0)
	file := A_Args[1]

Loop, read, %file%
{
	if(!props && InStr(A_LoopReadLine, "|"))
	{
		props := StrSplit(A_LoopReadLine, "|")		
	}
	Else if(StrLen(A_LoopReadLine) > 0 )
	{
		property := props[props_index]		
		if props_index = 1
		{
			newQ := {(property):A_loopReadLine}
			nqs.Push(newQ)
			props_index := props_index + 1			
		}
		else if(props_index < props.MaxIndex())
		{
			newQ[property] := A_LoopReadLine
			props_index := props_index + 1
		}
		Else
		{
			newQ[property] := A_LoopReadLine
			props_index = 1
		}		
	}	
}
helpText =
(

----------------------------
onlyAsk.txt filter questions
ALT+F4 (Close application)
)
MsgBox, , Begin questions, % "Number of quesions: " . nqs.MaxIndex() . helpText
Gosub, beginTest
return

beginTest:
Loop % nqs.MaxIndex()
{
	question := nqs[A_Index]
	NQ := question.nq
	if !NQ
		NQ := A_Index
	qprogress := NQ . " (" . A_Index . "/" . nqs.MaxIndex() . ") [HelpToStudy]"
	Q := question.q
	A := question.a
	bCount = 1 ; se habilita contar 
	if onlyAsk 
		{
			if NQ in %onlyAsk%
			Gosub, ValidateQ
		}
	Else
		Gosub, ValidateQ		
}
retryMessage := NWrong > 0 ? "Would you like to retry *WRONG* questions?" : ""
finalResult =
(
%NCorrect% Correct
%NWrong% Wrong
%NSkiped% Skiped
%retryMessage%
)

if NWrong > 0 
	MsgBox, 5, Final result, %finalResult%
Else
	MsgBox, , Final result, %finalResult%
IfMsgBox Retry
    {
    	onlyAsk := tempOnlyAsk
    	FileAppend, %onlyAsk%, onlyAsk.txt ;store onlyAsk
    	tempOnlyAsk := ""
    	NWrong = 0
    	NCorrect = 0
    	NSkiped = 0
    	Gosub, beginTest
    }
FileDelete, onlyAsk.txt
ExitApp, 0
return

ValidateQ:
InputBox, RQ, %qprogress%, %Q% 
	if (ErrorLevel != 1) ;not cancel
	{
		RegExReplace(RQ, ".*?\w+" , , RQWordsCount, -1, 1)
		RegExReplace(A, ".*?\w+" , , AWordsCount, -1, 1)
		formattedRQ := StrReplace(RQ, A_Space, "")
		formattedA := StrReplace(A, A_Space, "")

		if(formattedRQ=formattedA and RQWordsCount=AWordsCount)
			{
				MsgBox, , %NQ%, Correcto, 2
				if BCount
					NCorrect++
			}
		Else
			{
				errorDetail := "#Bad`r`n`t" . RQ . "`r`n" . "#Correct`r`n`t" . A
				MsgBox, , %NQ%, %errorDetail%
				if BCount
					{
						NWrong++
						tempOnlyAsk := tempOnlyAsk . "," . NQ
					}
				BCount = 0
				Gosub, ValidateQ
			}
	}else
	{
		if BCount
			NSkiped++
	}
return

#IfWinActive, [HelpToStudy]
!F4::
	ExitApp, 0
return
#if