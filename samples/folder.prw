#include "protheus.ch"

// TFolder com três abas e controles em cada aba.
User Function TelaFld()
    Local oDlg, oFld
    Local cNome := Space(30), cEnd := Space(40), cObs := ""
    Local lAtivo := .T.

    DEFINE MSDIALOG oDlg TITLE "Pastas" FROM 0,0 TO 300,460 PIXEL

    @ 005,005 FOLDER oFld PROMPTS "Geral","Endereço","Observações" SIZE 220,120 OF oDlg PIXEL

    @ 010,010 SAY "Nome:" SIZE 30,8 OF oFld:aDialogs[1] PIXEL
    @ 010,045 MSGET cNome SIZE 120,10 OF oFld:aDialogs[1] PIXEL
    @ 025,010 CHECKBOX lAtivo PROMPT "Ativo" SIZE 40,8 OF oFld:aDialogs[1] PIXEL

    @ 010,010 SAY "Endereço:" SIZE 35,8 OF oFld:aDialogs[2] PIXEL
    @ 010,050 MSGET cEnd SIZE 150,10 OF oFld:aDialogs[2] PIXEL

    TMultiGet():New(005,005,{|u| If(PCount()>0,cObs:=u,cObs)},oFld:aDialogs[3],200,80,,,,,,.T.)

    @ 130,185 BUTTON "Fechar" SIZE 37,12 ACTION oDlg:End() OF oDlg PIXEL
    ACTIVATE MSDIALOG oDlg CENTERED
Return
